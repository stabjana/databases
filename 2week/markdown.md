# Markdown short intro

### more information:

- www.markdownguide.org
- wikipedia article
- or just google markdown

### preview in vscode

- windows version
  - ctrl+shift+v
- mac version
  - cmd+shift+v

you can split the screen and see the preview the same time you're writing.

## headers

#### 4th lvl header

##### 5th lvl header

###### 6th lvl header

## text formating

Some text _this is in italic_ and **this is bold**

`const code = 'hier steht ein code'`<br>

Two spaces at the end of line makes line break (klappt nicht, or just use 'br' a line break)

## Lists

- item1
  - subitem

1. item1
2. item2

<div style="page-break-after:always;"></div>

## Block quoting

> this is first lvl  
> more text
>
> > this is the nested quote  
> > more text
> >
> > > nested of nested  
> > > more text

### example

# **function (a, b)**

> description
>
> > parameters
> >
> > - a = value
> > - b = value
> >
> > returns
> >
> > - sum of a and b

(spaces are from prettier)

### code snippets:

to start the server:
works with the command line, there is no user interface

### terminal or shell

```shell
> node -v
```

'to tell its a prompt use this >'

### javascript

```js
const number = 12;
if (number > 10) {
  console.log("winner");
}
```

### json

```json
{
  "firstname": "Mike",
  "age": 25
}
```

<div style="page-break-after:always;"></div>

### html

```html
<h1>Hallo!</h1>
```

### css

```css
ul {
  display: flex;
  flex: 3;
  list-style-type: none;
}
```

## tables

| header1 | header2 | header3 |
| :-----: | :-----: | :-----: |
|   d1    |   d2    |   d3    |

#### align items with : sign

| alignment | tag  |
| --------- | :--: |
| left      | :--- |
| right     | ---: |
| center    | :--- |
