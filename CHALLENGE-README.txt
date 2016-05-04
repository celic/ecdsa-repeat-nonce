# The Challenge:
----------------

Determine the secret key used to ECDSA sign each message. Unfortunately a nonce was repeated...


# What we expect:
-----------------

0) Write code to solve the challenge. Use whatever language you are comfortable with.

1) Spend at maximum /3/ hours on this exercise. If you cannot solve it in this time, please write a brief description of your thought process and how you would proceed if given further time.

2) After completing the challenge, write a recommendation on how to fix the underlying issue.

3) Provide us with your code and recommendation.


# 'signatures'
--------------

The file 'signatures' contains 10000 ECDSA signed messages.

Signatures are separated by newlines. Each line is of the form "message,s,r".

'message' is the message that was signed.
's' is one half of the signature.
'r' is the other half of the signature.

CAVEAT: The 'message' value is actually the parameter z in step 2 of https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm. You will NOT have to hash anything.

The elliptic curve used is NIST P-256.

The public key is as follows (x,y):
	(56692658308649883752888215646510808215127113736006267129499762463931215516844, 97081091794427194507540794274477292476482729491363045888596340943914810088122)



# Getting Help
--------------
We will be available to answer any questions about the challenge. You will NOT be penalized for asking questions. In a real world scenario the client will be there to answer - we are the client in this case. If none of this makes _any_ sense to you, that's fine - we're happy to point you in the direction of some introduction to cryptography resources.

Some examples of questions:
	Q: What is ECDSA?
	A: https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm

	Q: Where can I locate the elliptic curve parameters of NIST P-256 ?
	A: http://csrc.nist.gov/groups/ST/toolkit/documents/dss/NISTReCur.pdf.

	Q: Where can I find formulae for elliptic curve point addition and doubling ?
	A: If you really want to write your own ECC library, see https://hyperelliptic.org/EFD/g1p/auto-shortw-jacobian-3.html.

Feel free to consult any sources (including the internet) when completing this challenge. You are free to use any libraries of your choosing, however, the main code used to solve the challenge should be your own.

