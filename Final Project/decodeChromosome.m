%Extra Credit: Decode Chromosome
%Benjamin Asdell, UID: 005114992
%Personal implementation of converting chromosomes from the algorithm space
%(unsigned 32-bit integers) to the solution space (angle values in radians)

function x = decodeChromosome(chromosome)
    %initialization of masks for each separate angle byte
    mask1 = uint32(4278190080); %last 8 bits
    mask2 = uint32(16711680); %middle left 8 bits
    mask3 = uint32(65280); %middle right 8 bits
    mask4 = uint32(255); %first 8 bits
    %extracting specific angle byte from chromosome
    part1 = bitand(chromosome,mask1);%first angle
    part2 = bitand(chromosome,mask2);
    part3 = bitand(chromosome,mask3);
    part4 = bitand(chromosome,mask4);%last angle
    %shifting bytes to be correctly interpreted as unsigned 8 bit integers
    part1 = bitshift(part1,-24); 
    part2 = bitshift(part2,-16);
    part3 = bitshift(part3,-8);
    %part4 is already correct
    parts = cast([part1, part2, part3, part4],'double');%needs to be type double for operations
    %mapping each encoded byte in (0,255) to (-pi,pi)
    x = zeros(1,4);
    for k = 1:4
        x(k) = -pi + parts(k)*(2*pi/255);
    end
end