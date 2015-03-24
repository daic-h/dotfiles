// Info

let PLUGIN_INFO =
<KeySnailPlugin>
    <name>Gmail checker</name>
    <description>Check for new mail</description>
    <description lang="ja">Gmail の新着チェック</description>
    <iconURL>https://sites.google.com/site/958site/Home/files/gmail-checker.ks.png</iconURL>
    <updateURL>https://gist.github.com/958/982477/raw/gmail-checker.ks.js</updateURL>
    <author>958</author>
    <version>0.0.2</version>
    <license>MIT</license>
    <include>main</include>
    <detail lang="ja"><![CDATA[
=== 使い方 ===
Gmail に新着メールがある場合に、アドオンバーに表示します

エクステ 'gmail-checker-mail-list' を実行すると新着メールを表示します

=== 流用元 ===
gmail_biff.js at master from vimpr/vimperator-plugins - GitHub
https://github.com/vimpr/vimperator-plugins/blob/master/gmail_biff.js
]]></detail>
</KeySnailPlugin>;

// Option

let pOptions = plugins.setupOptions("gmail_checker", {
    'interval': {
        preset: 60,
        description: M({
            ja: "チェック時間 [秒] (初期値: 60)",
            en: "Check interval [s] (default: 60)"
        })
    },
    'unread_mail_count_style': {
        preset: 'font-weight:bold; color: #383838;',
        description: M({
            ja: '未読メールカウント数のスタイル',
            en: 'unread mail count in the statusbar with CSS'
        })
    },
    'keymap': {
        preset: {
            "C-z"   : "prompt-toggle-edit-mode",
            "SPC"   : "prompt-next-page",
            "b"     : "prompt-previous-page",
            "j"     : "prompt-next-completion",
            "k"     : "prompt-previous-completion",
            "g"     : "prompt-beginning-of-candidates",
            "G"     : "prompt-end-of-candidates",
            "q"     : "prompt-cancel",
            // gmail-checker specific actions
            "o"     : "open",
            "O"     : "gmail",
        },
        description: M({
            ja: "メイン画面の操作用キーマップ",
            en: "Local keymap for manipulation"
        })
    },
}, PLUGIN_INFO);

// Main

const ICON_E = 'data:image/png;base64,'+
'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAhklEQVQ4y9WQsQ3AIBADGYtZ2IZp'+
'2IBhUtKlTZfqwyNAhvyjpIpiyRX2YTDmc23WUvPhPZ0hLM0Z7AwANsVIqvLZnDd4++6cDqllzuCK'+
'DmCpkKnMEgEiRCgvAVxAyFCGVTIgpfLTCMFyOcsZGdDKNdCeg7MxcwPMZVUVIi54LG3BG3fA/3UB'+
'6Ygi+4dDfeoAAAAASUVORK5CYII=';

const ICON_D = 'data:image/png;base64,'+
'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAgElEQVQ4y9WQwQ3AIAwDM24GYRIW'+
'YYBswhJUrhTk0gS1r6qW/MI+DCKfS1WHu9Y6WmtbI8OdCwA2s5EJZ2te+PZSSgrxMjK8YgKgDLKW'+
'oRAQQaLyFoACQ7jMq0JA7/38aYZwGWfIhAAve8Cfw7M5cwOs5UwOCRc8VbrgjSfg/zoAVNwbywPd'+
'RZsAAAAASUVORK5CYII=';

const interval = pOptions['interval'] * 1000;

let panel = {
    _container : null,
    _label: null,
    _icon: null,

    create: function(){
        let container = document.getElementById('gmail-checker-status-panel');
        if (container)
            container.parentNode.removeChild(container);
        container = document.createElement('statusbarpanel');
        container.setAttribute('id', 'gmail-checker-status-panel');
        container.setAttribute('align', 'center');
        let box = document.createElement('hbox');
        box.setAttribute('align', 'center');
        box.setAttribute('flex', 1);
        let icon = document.createElement('image');
        icon.setAttribute('flex', 1);
        icon.setAttribute('src', ICON_D);
        let label = document.createElement('label');
        label.setAttribute('style', pOptions['unread_mail_count_style']);
        label.setAttribute('flex', 1);
        label.setAttribute('value', '-');
        box.appendChild(icon);
        box.appendChild(label);
        box.addEventListener("click", function(e) ext.exec('gmail-checker-mail-list'), false);
        container.appendChild(box);
        document.getElementById('status-bar').insertBefore(container,
                document.getElementById('keysnail-status').nextSibling);
        panel._container = container;
        panel._icon = icon;
        panel._label = label;
    },
    set tips(msg) {
        panel._container.setAttribute('tooltiptext', msg);
    },
    set count(count) {
        panel._icon.setAttribute('src', count > 0 ? ICON_E : ICON_D);
        panel._label.setAttribute('value', count);
    }
};

let checker = {
    _timer: null,
    _entries: [],

    get entries() {
        return checker._entries.map(function(entry) [ICON_E, entry.from, entry.title, entry.summary, entry.link]);
    },
    check: function() {
        checker._timer = null;
        try {
            let form = ['https://www.google.com', 'https://www.google.com', null];
            let passwordManager = Cc["@mozilla.org/login-manager;1"].getService(Ci.nsILoginManager);
            let logins = passwordManager.findLogins({}, form[0], form[1], form[2]);
            if(logins.length)
                var [gmailUser, gmailPassword] = [logins[0].username, logins[0].password];
            else {
                display.echoStatusBar("Gmail checker: account not found");
                return;
            }

            const url = 'https://mail.google.com/mail/feed/atom';
            let xhr = new XMLHttpRequest();
            xhr.mozBackgroundRequest = true;
            xhr.open("GET", url, false, gmailUser, gmailPassword);
            xhr.send(null);

            if (xhr.responseXML) {
                panel.tips = checker.title = xhr.responseXML.getElementsByTagName('title')[0].textContent;
                panel.count = parseInt(xhr.responseXML.getElementsByTagName('fullcount')[0].textContent);

                checker._entries = [];
                let entries = Array.slice(xhr.responseXML.getElementsByTagName('entry'));
                entries.forEach(function(entry){
                    checker._entries.push({
                        title: entry.getElementsByTagName('title')[0].textContent,
                        summary: entry.getElementsByTagName('summary')[0].textContent,
                        from: entry.getElementsByTagName('name')[0].textContent,
                        link: entry.getElementsByTagName('link')[0].getAttribute('href')
                    });
                });
            }
            checker.start();
        } catch(e) {
            util.message(e);
        }
    },
    start: function(){
        checker.stop();
        checker._timer = setTimeout(checker.check, interval);
    },
    stop: function(){
        if (checker._timer)
            clearTimeout(checker._timer);
    },
};

panel.create();
setTimeout(checker.check, 1000);

// Add ext
plugins.withProvides(function(provide){
    provide('gmail-checker-mail-list', function(ev, arg){
        let collection = checker.entries;
        if (collection.length == 0)
            return;
        prompt.selector({
            message     : checker.title + ':',
            collection  : collection,
            flags       : [ICON | IGNORE, 0, 0, 0, HIDDEN | IGNORE],
            header      : ['From', 'Title', 'Summary'],
            style       : [0, 0, style.prompt.description],
            width       : [20, 40, 40],
            keymap      : pOptions['keymap'],
            actions     : [
                [function(i) openUILinkIn(collection[i][4], 'tab'), "Open", "open"],
                [function(i) openUILinkIn('https://mail.google.com/', 'tab'), "Gmail", "gmail"],
            ]
        });
    }, M({en:'Show new mail', ja:'新着メールを表示'}));
    provide('gmail-checker-reload', function(ev, arg){
        checker.stop();
        checker.check();
    }, M({en:'Reload new mail', ja:'新着を今すぐ確認'}));
}, PLUGIN_INFO);
