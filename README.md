## Improvements

- Add header to nuclei
- `run-all.sh`
- get-files 
    - script to zip all the js files and then serve them via http
- Javascript Container:
    - ToDo:
        - replace getJS with GoSpider
    - Bugs:
        - If JS file has no Path or http/s at the beginning it is passed along. -> my.file.js
    - Current implementation:
        - only https files 
        - Only full URLs from getjs are analysed. 
        - Telegram messages bigger than 4096 are dropped. 
        - no custom regex added (ToDo)
    - getJs https://github.com/003random/getJS 
    - Linkfinder https://github.com/GerbenJavado/LinkFinder 
    - Secretfinder https://github.com/m4ll0k/SecretFinder 
    - Regex Patterns: 
        - https://github.com/odomojuli/RegExAPI 
        - https://github.com/l4yton/RegHex 
        - https://security.stackexchange.com/questions/215727/oauth-access-token-api-key-patterns-for-large-web-sites 

- Crawler Container
    - Gospider / https://github.com/s0md3v/Photon 
    - gf https://github.com/tomnomnom/gf
        - gf patterns https://github.com/1ndianl33t/Gf-Patterns 

- Reflected Parameter Container
    - https://github.com/tomnomnom/hacks/tree/master/kxss