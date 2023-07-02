module half_subtract(a,b,diff,carry);
input a,b;
output diff,carry;
wire an;
not(an,a);
xor(diff,a,b);
and(carry,an,b);
endmodule