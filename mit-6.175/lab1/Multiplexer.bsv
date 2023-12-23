function Bit#(1) and1(Bit#(1) a, Bit#(1) b);
    return a & b;
endfunction

function Bit#(1) or1(Bit#(1) a, Bit#(1) b);
    return a | b;
endfunction

function Bit#(1) xor1( Bit#(1) a, Bit#(1) b );
    return a ^ b;
endfunction

function Bit#(1) not1(Bit#(1) a);
    return ~ a;
endfunction

function Bit#(1) multiplexer1(Bit#(1) sel, Bit#(1) a, Bit#(1) b);
    return or1(and1(not1(sel), a), and1(sel, b));
endfunction

function Bit#(5) multiplexer5(Bit#(1) sel, Bit#(5) a, Bit#(5) b);
    return multiplexer_n(sel, a, b);
endfunction

typedef 5 N;
function Bit#(N) multiplexerN(Bit#(1) sel, Bit#(N) a, Bit#(N) b);
    Bit#(N) res;
    for(Integer i = 0; i < valueOf(N); i = i + 1) begin
        res[i] = multiplexer1(sel, a[i], b[i]);
    end
    return res;
endfunction

//typedef 32 N; // Not needed
function Bit#(n) multiplexer_n(Bit#(1) sel, Bit#(n) a, Bit#(n) b);
    Bit#(n) res;
    for(Integer i = 0; i < valueOf(n); i = i + 1) begin
        res[i] = multiplexer1(sel, a[i], b[i]);
    end
    return res;
endfunction