# Asymmetric encryption
Asymmetric encryption, also known as public-key cryptography, uses a pair of mathematically linked keys: a public and a private key. The public key can be freely shared and is used to encrypt data. The private key is never shared and can be used to decrypt data encrypted with the public key. This addresses one of the primary security concerns in symmetric cryptography: the need to share one key used to both encrypt and decrypt data.

Asymmetric encryption is also commonly used in the digital signature system. A private key can be used in conjunction with a message to create a digital signature. The receiver can then check the validity of the message using the freely sharable public key.

It eliminates the need for secret key exchange between two parties, can ensure messages and documents are indeed from the sender they claim to be from and the system is highly scalable because the public key can be freely shard. These advantages give asymmetric cryptography various useful applications:

- Confidential communications.
- Digital signatures.
- Key exchanges.
- Certificate Authorities (CA).
- Secure file transfers.
- Secure remote access.
- Blockchain technology.

There are however some drawbacks to to asymmetric encryption as well when compared to its symmetric counterpart"

1. The algorithms are generally slower and are thus more resource consuming.
2. The security of the algorithm relies on the computational difficulty of factoring large numbers and could therefor potentially be compromised by quantum computing in the future.
3. Storing and managing the keys is more complex as they are usually bigger than symmetric keys and we have to keep track of the public and private key as they are paired to each other.

## Key-terms
- **Key pair**: a pair of mathematically linked public and private keys using in asymmetric cryptography.
- **Digital signature**: cryptographic mechanism used to provide authentication, integrity, and non-repudiation to electronic documents, messages, or transactions.
- **Quantum computing**: a new technology using quantum mechanics to solve problems too complex for classical computers.

## Assignments

### Assignment 1
- [x] Generate a key pair.

### Assignment 2
- [x] Send an asymmetrically encrypted message to one of your peers via the public Slack channel. They should be able to decrypt the message using a key. The recipient should be able to read the message, but it should remain a secret to everyone else. You are not allowed to use any private messages or other communication channels besides the public Slack channel. Analyse the difference between this method and symmetric encryption.

### Sources
- [Public-key cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography)
- [Symmetric and Asymmetric Key Encryption – Explained in Plain English](https://www.freecodecamp.org/news/encryption-explained-in-plain-english/)
- [Online RSA Encryption, Decryption And Key Generator Tool](https://www.javainuse.com/rsagenerator)
- [Asymmetric Encryption](https://www.educba.com/asymmetric-encryption/)
- [What Are the Best Use Cases for Symmetric vs Asymmetric Encryption?](https://venafi.com/blog/what-are-best-use-cases-symmetric-vs-asymmetric-encryption/)

### Problems
No problems.

### Result

## Assignment 1

Using the [Online RSA Encryption, Decryption And Key Generator Tool](https://www.javainuse.com/rsagenerator) I created a 512 kb key pair:

Public key: 

```
MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAIo9TxrVTa+y3C7FUestXEDbkI9DSW4MUCjVwVdIz8NZCLdAB+nJ9vj29G9q9L4uexSSyAK8Y3gNFdLEcWJ/Bz8CAwEAAQ==
```

Private key:

```
Private key: MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAij1PGtVNr7LcLsVR6y1cQNuQj0NJbgxQKNXBV0jPw1kIt0AH6cn2+Pb0b2r0vi57FJLIArxjeA0V0sRxYn8HPwIDAQABAkAG/yVi0Ur2SpI0V85WndweeD5v0dMEm+DuwCrh9RB27ZXvbp9Ybk1ffCo9uF0NpFr3aGeNuDNvJMQS50dQLhuhAiEA9wQh848jsnFBDkLvAhpf9yuZIYjLchABkOVUqDwFmfECIQCPRGak55qhAYiKG+vfp1NKvUODRgTrl2q9hkynKBAELwIgP/Bt6WGv18zBDjP9MgoptQ0wAiIqp0fFYAA8vZ9rw8ECIFTvQz7+Q3CyXQUrunG0XC/R9qVrrF0TPmevp9/tY1lnAiEAlZykrRs5kJ0umzY7/l7ulfQ+eJUOCyTVBynUkS+xKu8=
```

## Assignment 2

In order to send an asymmetrically encrypted message ot one of my peers I need his/her public key first. The public/private key pair In generated in assignment one can only be used by my peer to encrypt a message with me as the destination.

He shared with me his public 512 kb key:

```
MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAM7GP+/yAN5YWb76/bX9igKsza2bGTramcNCKc8I/T5p09QPT69iNxH5z00f7GpR6vEqBkeCELxWq/rUEUVgF/sCAwEAAQ==
```

Using this key I encrypted the following message:

```
I am not superstitious, but I am a little stitious
```

Using the standard RSA cypher I generated the following scrambled Base64 text:

```
AvyZzkGZi+OUPUkjM7jnmmt1w78S4ZOD7RqUm+FQCavNL4fYEH6zdvRfj9SrJtpq85dTY1LvSwQogkTDQssbQQ==
```

After sharing the encrypted message with him, he was able to successfully decrypt it again using his private key: `I am not superstitious, but I am a little stitious`.

The main difference between the execution in this assignment as compared to the SEC_04 assignment is evident: no sharing of a secret key (asymmetric private key) was required and thus a far more secure way of communicating. Only my peer was in possession of the private key needed to decrypt the message and the publicly shared key could not be used for decryption purposes and therefor did not pose a security risk.

Both methods could be combined to increase the security of symmetric cryptography. By symmetrically encrypting data as usual with a secret key, but then also encrypting the secret key using asymmetric cryptography, we can achieve the best of both worlds: faster encryption of data via symmetric encryption and the ability to securely transfer the secret key for decryption purposes via asymmetric encryption.
