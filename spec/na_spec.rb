require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'dbla' do
  context 'nucleic' do
    before(:each) do
      dna = 'gatataggtgatattgtaagaggaagagatctatttcatggtaatccacaagaaaaagaaaaaagagaagacttagaaaagaaattgaaagaaattttccaacaaatacatagtggattgtcgaagaacggcgcacaaacttactacaatgataatgatactgacaaaaactattacaaattacgagaagattggtggacggcgaatcgcgccacaatctgggaagctatcacatgtgaagcaaaaactgatgataaatattttagaaatacatgtaatggaggaagtccaactaaaggtgactgccgatgtgctgccggagatgttcctacatattttgactacgttccgcagtatcttcgc'
      aa = 'DIGDIVRGRDLFHGNPQEKEKREDLEKKLKEIFQQIHSGLSKNGAQTYYNDNDTDKNYYKLREDWWTANRATIWEAITCEAKTDDKYFRNTCNGGSPTKGDCRCAAGDVPTYFDYVPQYLR'
      @tag_as_dna = Bio::Sequence::NA.new(dna)
      @tag_as_aa  = Bio::Sequence::AA.new(aa)
    end

    it 'should return the pspb1 in dna format' do
      Bio::Sequence::NA.new(@tag_as_dna.pspb1_as_dna).translate.should == @tag_as_aa.pspb1
    end

    it 'should return the pspb2 in dna format' do
      Bio::Sequence::NA.new(@tag_as_dna.pspb2_as_dna).translate.should == @tag_as_aa.pspb2
    end

    it 'should return the pspb3 in dna format' do
      Bio::Sequence::NA.new(@tag_as_dna.pspb3_as_dna).translate.should == @tag_as_aa.pspb3
    end

    it 'should return the pspb4 in dna format' do
      Bio::Sequence::NA.new(@tag_as_dna.pspb4_as_dna).translate.should == @tag_as_aa.pspb4
    end
  end
end
