# erlcash
ErlCash - Massively scalable cryptocurency written in Erlang

[![Build Status](https://api.travis-ci.org/ergenius/erlcash.svg?branch=master)](https://travis-ci.org/ergenius/erlcach)

ErlCash is a **cryptocurrency** with a focus on **privacy**, **performance**, **extensibility** and **functionality**.

ErlCash is written from **scratch** in Erlang. Erlcash is NOT another shitcoin but a genuine effort to create a new cryptocurrency.

## Project roadmap

| # | Description | Estimated date | Finish date | Status |
| --- | --- | --- | --- | --- |
| 1 | Argon2 password hashing for Erlang https://github.com/ergenius/eargon2 | na | na | DONE |
| 2 | Finishing epool - generic pooling library https://github.com/ergenius/epool | na | na | DONE |
| 3 | Implementing basic Blockchain | 1 april 2019 | ? | working |
| 4 | Implementing basic Merkle tree | 1 april 2019 | ? | working |
| 5 | Implementing planned hashing algorithm in Erlang | 1 april 2019 | ? | working |
| 6 | Implementing basic TCP, UDP and HTTPS REST API using mustang | 1 june 2019 | ? | planned |
| 7 | Writing the ErlCash Whitepaper | 1 august 2019 | ? | working |

More will be added soon on todo list.

## Erlang versions supported

ErlCash officially supports OTP release 17 and later.

Development of ErlCash takes place using a OTP 19.3 release and tests are done on:
- 17.5
- 18.3
- 19.3
- 20.0

Unofficially you may be able to use ErlCash with older Erlang versions. No guarantee included.

## Dependencies

- Epool Generic pooling library for Erlang - https://github.com/ergenius/epool
- Argon2 password hashing for Erlang https://github.com/ergenius/eargon2
- Mustang Http stack

## Authors

- Madalin Grigore-Enescu (ergenius) <github@ergenius.com>

## License

ErlCash is available in the public domain.

ErlCash is also optionally available under the MIT license (see `LICENSE`) for jurisdictions that do not recognize public domain works.
