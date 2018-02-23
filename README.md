# github-crypt <sub><sup>| Send encrypted messages to GitHubers via their SSH public key</sup></sub>

[![Join the chat at https://gitter.im/github-crypt/Lobby](https://badges.gitter.im/github-crypt/Lobby.svg)](https://gitter.im/github-crypt/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![version](http://img.shields.io/badge/version-v0.5.0-blue.svg)](https://github.com/rockymadden/github-crypt/releases)
[![versioning](http://img.shields.io/badge/versioning-semver-blue.svg)](http://semver.org/)
[![branching](http://img.shields.io/badge/branching-github%20flow-blue.svg)](https://guides.github.com/introduction/flow/)
[![license](http://img.shields.io/badge/license-mit-blue.svg)](https://opensource.org/licenses/MIT)
[![gitter](https://img.shields.io/gitter/room/nwjs/nw.js.svg)](https://gitter.im/rockymadden/github-crypt)
[![circleci](https://circleci.com/gh/rockymadden/github-crypt.svg?style=shield)](https://circleci.com/gh/rockymadden/github-crypt)

Takes advantage of the fact that GitHub makes users SSH public keys easily available
(e.g. [rockymadden](https://github.com/rockymadden.keys)). We can convert said public keys to PKCS8
pems to encrypt files. Encrypted files can then only be decrypted with the corresponding private
key.

## Example
1. You encrypt the file:
```console
$ github-crypt encrypt file.txt username
Encrypting: done
```
2. You send the file, `file.txt.enc`, to another user
3. They decrypt the file:
```console
$ github-crypt decrypt file.txt.enc
Decrypting: done
```

## Maximum message length
Be aware, a maximum message length exists which depends upon the key size:

| Key Size (bits) | Maximum Message Length (bytes)
| --------------- | ------------------------------
| 768             | 85
| 1024            | 117
| 2048            | 246
| 4096            | 502
| 8192            | 1018

## Installation
```console
$ brew install rockymadden/rockymadden/github-crypt
```

## Usage
```console
$ github-crypt --help
Usage:
  github-crypt bits <username> [--index|-i <index>]
  github-crypt decrypt <file> [--key|-k <key>]
  github-crypt encrypt <file> <username> [--index|-i <index>]
  github-crypt keys <username> [--index|-i <index>]

Discovery Commands:
  bits     Output GitHub public key(s) bit-length
  keys     Output GitHub public key(s)

Crypto Commands:
  encrypt     Encrypt a file with a GitHub public key; only the corresponding private key can decrypt
  decrypt     Decrypt a file with the private key corresponding to the GitHub public key used to encrypt
```

> __PROTIP:__ All commands prompt for required arguments which were not provided via options or
arguments. This allows for both traditional usage and prompt-based usage.

## License
```
The MIT License (MIT)

Copyright (c) 2018 Rocky Madden (https://rockymadden.com/)

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
