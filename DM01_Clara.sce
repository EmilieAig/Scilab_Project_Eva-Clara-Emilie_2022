// DM01

mode(0)

// 2. Write a script that displays n sinusoids of the same amplitude and phase, but with a random frequency chosen between minFreq and maxFreq.

// Definition of basic parameters.

samplingFrequency = 100;
samplingPeriod = 1 / samplingFrequency;

begTime = 0;
endTime = 5;
time = begTime : samplingPeriod : endTime;
time = time';

signalAmplitude = 1;
signalPhase = 0;

minFreq = 2;
maxFreq = 5;

// Enter the number n of sinusoids.

n = input('Please give the number of sinusoids : ');

// Use the function "sinusoide.sci" for each sinusoid with a random frequency.

for i = 1 : n
    signalFrequency = grand(1,"uin", minFreq, maxFreq);
    signal = sinusoide(time, signalAmplitude, signalFrequency, signalPhase);
    signalFrequency = signalFrequency + 1;
    plot (time, signal, "Color", i);
    xtitle("Graph of n sinusoids", "Time(s)", "Amplitude");
    title fontsize 4;
end
