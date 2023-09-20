module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
	wire w1,w2,w3,w4;
    and a1(w1,p1a,p1b,p1c);
    and a2(w2,p1d,p1e,p1f);
    and b1(w3,p2a,p2b);
    and b2(w4,p2c,p2d);
    or o1(p1y,w1,w2);
    or o2(p2y,w3,w4);

endmodule