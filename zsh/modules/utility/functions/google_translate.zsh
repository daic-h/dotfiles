# google_translate [-j, -e]
# $ google_translate -e power line

function google_translate() {
  local str opt arg

  str=`pbpaste` # clipboard
  arg=`echo ${@:2} | sed -e 's/  */+/g'` # argument
  en_jp="?hl=ja&sl=en&tl=ja&ie=UTF-8&oe=UTF-8" # url

  case "$1" in
    "-j")
      opt="?hl=ja&sl=ja&tl=en&ie=UTF-8&oe=UTF-8&text=${arg}";; # jp -> en translate
    "-e")
      opt="${en_jp}&text=${arg}";; # en -> jp translate
    *)
      opt="${en_jp}&text=${str}";; # en -> jp translate
  esac

  w3m +20 "http://translate.google.com/${opt}"  # goto 20 line
}
