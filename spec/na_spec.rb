require 'csv'

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'dbla' do
  context 'nucleic' do
    before(:each) do
      dna = 'gatataggtgatattgtaagaggaagagatctatttcatggtaatccacaagaaaaagaaaaaagagaagacttagaaaagaaattgaaagaaattttccaacaaatacatagtggattgtcgaagaacggcgcacaaacttactacaatgataatgatactgacaaaaactattacaaattacgagaagattggtggacggcgaatcgcgccacaatctgggaagctatcacatgtgaagcaaaaactgatgataaatattttagaaatacatgtaatggaggaagtccaactaaaggtgactgccgatgtgctgccggagatgttcctacatattttgactacgttccgcagtatcttcgc'
      aa  = 'DIGDIVRGRDLFHGNPQEKEKREDLEKKLKEIFQQIHSGLSKNGAQTYYNDNDTDKNYYKLREDWWTANRATIWEAITCEAKTDDKYFRNTCNGGSPTKGDCRCAAGDVPTYFDYVPQYLR'
      @tag_as_dna = Bio::Sequence::NA.new(dna)
      @tag_as_aa  = Bio::Sequence::AA.new(aa)
    end

    it 'should return the pspb1 in dna format' do
      Bio::Sequence::NA.new(@tag_as_dna.pspb1_dna).translate.should == @tag_as_aa.pspb1
    end

    it 'should return the pspb2 in dna format' do
      Bio::Sequence::NA.new(@tag_as_dna.pspb2_dna).translate.should == @tag_as_aa.pspb2
    end

    it 'should return the pspb3 in dna format' do
      Bio::Sequence::NA.new(@tag_as_dna.pspb3_dna).translate.should == @tag_as_aa.pspb3
    end

    it 'should return the pspb4 in dna format' do
      Bio::Sequence::NA.new(@tag_as_dna.pspb4_dna).translate.should == @tag_as_aa.pspb4
    end

    it 'should return distance from anchor point given a position' do
      #@tag_as_dna.mut_pos = [380,369,67,62,56]
      #@tag_as_dna.polv1_dna_pos.should == -27
      #@tag_as_dna.coordinates.each do |row|
      #puts row.to_csv
      #end
    end

    it 'should return an array of coordinates ' do
    end

    it 'should return the D homology block' do
        puts @tag_as_dna.h_block_D
    end
  end
end
