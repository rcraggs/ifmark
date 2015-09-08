# ifmark

pre-process a markdown file to optionally include certain html comments

## usage

```
./ifmark COND FILE
```

This will output FILE. If there are any html comments in the format <!-- CONDITION:COND etc etc --> it will replace that block with 'etc etc'

Useful for having a markdown document that can optionally include content
