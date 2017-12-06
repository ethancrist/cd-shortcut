# cd-shortcut
Bookmark long linux directories into keywords to be accessed faster.

## Installation
```bash
git clone https://github.com/ethancrist/cd-shortcut.git && \
cd-shortcut/init.sh && \
echo "alias cds='source /usr/local/bin/cds'" >> ~/.bashrc && \
alias cds="source /usr/local/bin/cds"
```

## Usage
###### Add a shortcut
```bash
cds -add <key> <dir>
```

###### Use a shortcut
```bash
cds <key>
```

###### Remove a shortcut
```bash
cds -rm <key>
```

###### List all shortcuts
```bash
cds ls
```

## Example
First, point a key to a directory
```bash
cds -add dev /my/very/long/nested/dev/directory/that/takes/years/to/type/
```
Now, typing
```bash
cds dev
```

is like typing
```bash
cd /my/very/long/nested/dev/directory/that/takes/years/to/type/
```

<hr>

#### Footnotes
- ###### Keys automatically overwrite when using ``` cds -add <key> ```
- ###### There is no practical limit to the keys you can store
- ###### This does not use symlink or any other native ubuntu folder linking
- ###### Reading and writing keys are extremely fast, as storage is microscopic
- ###### This application is solely bash therefore completely stateless, meaning it won't eat up memory
