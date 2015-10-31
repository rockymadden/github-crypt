# github-crypt <sub><sup>| Easy encryption via GitHub users' public ssh keys</sup></sub>
[![semver](http://img.shields.io/badge/semver-v0.0.0-blue.svg)](http://semver.org/)
[![license](http://img.shields.io/badge/license-mit-blue.svg)](https://opensource.org/licenses/MIT)
[![status](http://img.shields.io/badge/status-working-brightgreen.svg)](#)

## Installation
```bash
$ brew tap rockymadden/rockymadden
$ brew install github-crypt
```

## Usage

All subcommands prompt for required arguments which were not provided via options, which allows for
both option-based and interactive usage.

#### Help:
```bash
$ ghcrypt --help
```

#### Encryption:
```bash
$ ghcrypt encrypt
$ ghcrypt encrypt -u rockymadden
$ ghcrypt encrypt -u rockymadden -i ./file -o ./file.enc -k 1
$ ghcrypt encrypt --username rockymadden --in ./file --out ./file.enc --key 1
```

#### Decryption:
```bash
$ ghcrypt decrypt
$ ghcrypt decrypt -i ./file.enc -o ./file.dcr
$ ghcrypt decrypt -k ~/.ssh/id_rsa -i ./file.enc -o ./file.dcr
$ ghcrypt decrypt --key ~/.ssh/id_rsa --in ./file.enc --out ./file.dcr
```

## License
```
The MIT License (MIT)

Copyright (c) 2015 Rocky Madden (https://rockymadden.com/)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
