# Intro Data structures

## Storing data

2 ways:

- in memory
  - will be cleared every time boot or program start
- or in disc storage
  - disc = every physical storage
  - for persistance

whole data of one program should fit in the memory

binary files

## disc storage

- ### binary file

  - data in binary format
  - images
  - audio
  - video
  - **compiled program (is in binary format)**

- be careful with binary file formats
  - for textFiles ascii was the encoder and now its unicode coding = is formatted automatically, its built in nowadays
  - needs to be converted when you don't have the software to handle it anymore (Pleite der firma zB).
  - every bit in a certain position has a specific meaning, je nach storage format der Software - kompliziert!
  - dont lose the programs to open the files with (or convert them to other formats)
  - JS is text basiert und man kann es lesen.

binary for file formats:
https://en.wikipedia.org/wiki/List_of_file_signatures
https://en.wikipedia.org/wiki/Magic_number_(programming)

### bits 0 and 1

- 1 bit can represent 2 states: 0 or 1
- 2 bits can represent 4 states: 00, 01, 10, 11
- 3 bits - 8states states: 2³ = 2*2*2 (octadecimal)
- binary system is base 2 positional system (like 10 based)

octadecimal system use 3 bits

- 421

- 000=0 => 0*4 + 0*2 + 0*1 => 0*2² + 0*2hoch1 + 0*2hoch0
- 001=1
- 010=2 (positional number system)
- 011=3 => <!-- 0*4 + 1*2 + 1*1 = 0+2+1 = 3 -->
- 100=4
- 101=5
- 110=6
- 111=7 (all numbers in 8-based system)

hexadecimal is from 0-15, but its a positional system - after 9 it starts with letters

giving rights in shell:
coming from octa based system bits:
chmod: 777 permission to all means giving: 111111111

- **plain text file**
  (is also binary file but there is a convention how text is been coded)
  there is some kind of editor in the file system to interpret the text

### text file containing "unstructured" free text

```
Matt River
2024

Memo

This year 2023 was great start in the development of GTX series. This new product was made by Vera River who also was attending the lauch....
```

```
Memo

This year 2024 was great start in the development of GTX series. This new product was made by Vera River who also was attending the lauch....

Matt River
2024

```

you need to know that the first line contains the writer and in the second is the year. Its hard to read for the machine.
How to handle it with program?
or is the information in the last line?

we need to figure out what is where.

we cant search for the mname because there is another year or name.

PROBLEM: hard to process programmatically
we want to write a program that works for us:

```
made by Matt River
year 2024

Memo

This year 2024 was great start in the development of GTX series. This new product was made by Vera River who also was attending the lauch....
```

better but not enough

- need to have metadata:
  - Solution: Structured file text format
  - structured text format

### XML

```xml
<document>
<writer>
<firstname>Matt</firstname>
<lastname>River<lastname>
</writer>
<year>2024</year>
<title>memo</title>
<text>This year 2024 was great start in the development  of GTX series. This new product was made by Vera River who also was attending the launch....
</text>
</document>
```

there are fixed elements in html but here we just give the names

you need to have some 3rd party library to parse it with JS
thats why we dont use xml for JS

### We use JSON

```json
{
  "writer": {
    "firstname": "Matt",
    "lastname": "River"
  },
  "year": 2024,
  "title": "Memo",
  "text": [
    "This year 2024 was great start in the development",
    "of GTX series. This new product was made by Vera River",
    "who also was attending the launch...."
  ]
}
```

string is separated to make it easier to read in the editor, you need to .join them again.
not for the databases! we can have them in one big string.

### structured text files

- xml (www.w3.org)
  - open data is a lot in xml format
- json (www.json.org)
  - different standarts are in one page
- csv/tsv

  - comma or tab separated values

    - also easy to read for JS - separator
      handy format for transfering tabular data between spreadsheet and your program

- ini (from windows)
- html/css files (html.spec.whatwg.org/multipage)
- markdown
- svg (for images, xml file)

## Examples

### xml file

```xml
<!-- <?xml version="1.1" encoding ="UTF-8"> -->
<persons>
    <person>
        <firstname>Matt</firstname>
        <lastname>River</lastname>
        <age>25</age>
    </person>
    <person>
        <firstname>Vera</firstname>
            <lastname>River</lastname>
        <age>27</age>
    </person>
</persons>
```

### json

```json
[
  {
    "firstname": "Matt",
    "lastname": "River",
    "age": 25
  },
  {
    "firstname": "Vera",
    "lastname": "River",
    "age": 27
  }
]
```

in json:
\ is an escape sign
you cant have comments

### csv

```csv
firstname,lastname,age
Matt,River,25
Vera,River,27
Matt, "River, Jr",10
```

if a comma is inside the string you have to use "" around the element

### ini

```ini
;this is comment in ini file
[database]
driver=mysql
host=localhost
port=3306
database=persondb
[user]
username=zeke
```

können von apps geladen werden
sind für win, conf für linux
when windows came on top of dos

### html/css

look at markdown.md

### svg

<svg width="200" height="200">
    <rect x="2" y="2" width="196" height="196"
    fill="brown" stroke-width="4" stroke="orange" />
    <circle cx="100" cy="100" r="75" fill="pink" />
</svg>
