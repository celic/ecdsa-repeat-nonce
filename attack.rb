require 'ecdsa'
require 'csv'
require_relative 'modular_arithmetic'

msg = []
s = []
r = []

# read in signatures
CSV.foreach("signatures") do |row|
	msg << row[0].to_i
	s << row[1].to_i
	r << row[2].to_i
end

# set up signature structures (mainly for verifying signatures)
sigs = []
s.each_with_index do |val, i|
	sigs << ECDSA::Signature.new(r[i], val)
end

# set up elliptic curve
pub_x = 56692658308649883752888215646510808215127113736006267129499762463931215516844
pub_y = 97081091794427194507540794274477292476482729491363045888596340943914810088122
group = ECDSA::Group::Nistp256
pub_key = ECDSA::Point.new(group, pub_x, pub_y)

# verify signatures (they all validate so this can be skipped)
# msg.each_with_index do |m, i|
#
# 	valid = ECDSA.valid_signature?(pub_key, m, sigs[i])
#
# 	unless valid then puts "invalid! #{i}" end
# end

# check for repeated r values (i.e. values with poor nonce / repeated k)
repeats = r.uniq.keep_if { |e| r.count(e) > 1 }

# we only need one repeated r value for the attack so we ignore the rest
repeat = repeats.first

# find indexes for digests and s values
first_index  = r.index { |e| e == repeat }
second_index = r.rindex { |e| e == repeat }

# calculations to find private key (straight from the linked wikipedia article)
r1 = repeat
s1 = s[first_index]
s2 = s[second_index]
z1 = msg[first_index]
z2 = msg[second_index]

k_numerator = (z1 - z2) % group.order
k_denominator = (s1 - s2) % group.order

k = ModularArithmetic.divide(k_numerator, k_denominator, group.order)

priv_numerator = ((s1 * k) - z1) % group.order
priv_key = ModularArithmetic.divide(priv_numerator, r1, group.order)

# ggwp
puts priv_key

# quick verification to match up against public key
verify_key = group.generator.multiply_by_scalar(priv_key)
puts "public key: "
puts "  x: #{(verify_key.x == pub_x) ? "verified" : "incorrect"}" 
puts "  y: #{(verify_key.y == pub_y) ? "verified" : "incorrect"}"