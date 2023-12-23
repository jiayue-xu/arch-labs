function Bit#(32) shiftRightPow2(Bit#(1) en, Bit#(32) unshifted, Integer power);
    Integer shiftBy = 2**power;
    Bit#(32) shifted = 0;
    for(Integer i = 0; i < 32; i = i + 1) begin
        if(i <= 31 - shiftBy) begin
            shifted[i] = unshifted[shiftBy + i];
        end
    end
    return en == 0 ? unshifted : shifted;
endfunction

function Bit#(32) barrelShifterRight(Bit#(32) in, Bit#(5) shiftBy);
    Bit#(32) shifted = in;

    for(Integer i = 0; i < 5; i = i + 1) begin
        shifted = shiftRightPow2(shiftBy[i], shifted, i);
    end
    return shifted;
endfunction