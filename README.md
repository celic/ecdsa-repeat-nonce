# ecdsa-repeat-nonce
An attack on ECDSA where nonce was repeated between signatures

## run

Make sure Ruby is installed. Any version >1.9.3 should suffice, but 2.2.1 was used while testing. 

Install the ECDSA library used:

    gem install ecdsa
  
Run the attack:

    ruby attack.rb
  
The private key and verification are printed to the console. 
