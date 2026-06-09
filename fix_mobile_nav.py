import re
from pathlib import Path

root = Path('.')
files = list(root.glob('*-dekstop.html'))

for f in files:
    text = f.read_text(encoding='utf-8')
    
    # Remove all escaped backslash-n
    text = text.replace('`n', '')
    
    # Remove any duplicate mobile menu buttons
    # Keep first, remove subsequent
    count = 0
    def replace_button(match):
        global count
        count += 1
        if count == 1:
            return match.group(0)
        return ''
    
    text = re.sub(
        r'<button id="mobile-menu-button"[^>]*>.*?</button>',
        lambda m: m.group(0) if text.find(m.group(0)) == text.find(m.group(0)) else '',
        text,
        flags=re.S
    )
    
    # Clean multiple occurrences more aggressively
    while '<button id="mobile-menu-button"' in text.split('</button>')[1] if '</button>' in text else False:
        parts = text.split('<button id="mobile-menu-button"', 1)
        if len(parts) > 1:
            first_button = parts[0] + '<button id="mobile-menu-button"'
            rest = '<button id="mobile-menu-button"'.join(parts[1:])
            # Remove second and subsequent buttons
            rest = re.sub(r'<button id="mobile-menu-button".*?</button>', '', rest, count=None, flags=re.S)
            text = first_button + rest
        else:
            break
    
    f.write_text(text, encoding='utf-8')
    print(f'Fixed {f.name}')
