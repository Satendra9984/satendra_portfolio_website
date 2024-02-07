
import requests
import io


result = requests.get("https://github.com/Satendra9984/veridox/blob/master/README.md")
readme_content = (result.text)

with io.open(1, 'w', encoding='utf-8', closefd=False) as stdout:
        stdout.write(readme_content)


