# github-crypt <sub><sup>| Asymmetric cryptography via GitHub SSH keys</sup></sub>
[![version](http://img.shields.io/badge/version-v0.3.0-blue.svg)](https://github.com/rockymadden/github-crypt/releases)
[![versioning](http://img.shields.io/badge/versioning-semver-blue.svg)](http://semver.org/)
[![branching](http://img.shields.io/badge/branching-github%20flow-blue.svg)](https://guides.github.com/introduction/flow/)
[![license](http://img.shields.io/badge/license-mit-blue.svg)](https://opensource.org/licenses/MIT)
[![status](http://img.shields.io/badge/status-working-brightgreen.svg)](#)

Uses the fact that GitHub makes users public SSH keys available to everyone
(e.g. [rockymadden](https://github.com/rockymadden.keys)). We can convert said public keys to PKCS8
pems and encrypt files with them. Encrypted files can then only be decrypted with the corresponding
private key. Workflow:

* You execute `github-crypt encrypt`
* Send encrypted file(s) to the user
* They execute `github-crypt decrypt`

Be aware, a maximum message length exists which depends upon the key size:

| Key Size (bits) | Maximum Message Length (bytes)
| --------------- | ------------------------------
| 768             | 85
| 1024            | 117
| 2048            | 246
| 4096            | 502
| 8192            | 1018

## Installation
```bash
$ brew tap rockymadden/rockymadden
$ brew install github-crypt
```

## Usage

All subcommands prompt for required arguments which were not provided via options. This allows for
both traditional option-based usage and also interactive/prompt-based usage.

```bash
$ github-crypt --help
Usage:
  github-crypt bits [--username|-u <username>] [--index|-x <index>]
  github-crypt decrypt [--key|-k <path>] [--in|-i <path>] [--out|-o <path>]
  github-crypt encrypt [--username|-u <username>] [--index|-x <index>] [--in|-i <path>] [--out|-o <path>] [--upload|-l]
  github-crypt keys [--username|-u <username>] [--index|-x <index>]

Discovery Commands:
  bits     Output GitHub public key(s) bit-length
  keys     Output GitHub public key(s)

Crypto Commands:
  encrypt     Encrypt a file with a GitHub public key; only the corresponding private key can decrypt
  decrypt     Decrypt a file with the private key corresponding to the GitHub public key used to encrypt
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
