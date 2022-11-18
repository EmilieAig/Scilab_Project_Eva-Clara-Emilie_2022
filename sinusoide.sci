function signal = sinusoide(time, amplitude, frequency, phase)
    signal = amplitude * cos((2 * %pi * frequency) .* time + phase);
endfunction
