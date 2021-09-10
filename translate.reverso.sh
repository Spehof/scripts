#!/bin/sh

# This skript translate EN -> RU from STDIN
# Using https://www.reverso.net API
# For change languages

TEXT=$(cat)

LANG_FROM=eng
LANG_TO=rus


generate_post_data(){
	cat <<EOF
		{"input":"$TEXT",
		"from":"$LANG_FROM",
		"to":"$LANG_TO",
		"format":"text",
		"options":{
			"origin":"reversodesktop",
			"sentenceSplitter":true,
			"contextResults":true,
			"languageDetection":false
			}
		}
EOF
}

get_translate_from_API(){

curl -s 'https://api.reverso.net/translate/v1/translation' \
	-H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' \
	-H 'Accept: application/json, text/javascript, */*; q=0.01' \
	-H 'Accept-Language: en-US,en;q=0.5' --compressed \
	-H 'Content-Type: application/json; charset=utf-8' \
	-H 'Origin: https://www.reverso.net' \
	-H 'DNT: 1' \
	-H 'Connection: keep-alive' \
	-H 'Referer: https://www.reverso.net/' \
	-H 'Sec-Fetch-Dest: empty' \
	-H 'Sec-Fetch-Mode: cors' \
	-H 'Sec-Fetch-Site: same-site' \
	--data "$(generate_post_data)"
}

get_translate_from_API | jq '.translation[]'