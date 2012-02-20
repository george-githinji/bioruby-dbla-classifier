require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Dbla" do
  context 'a group4 Dbla tag' do
    before(:each) do
      seq = 'YIGDIIRGRDLYLVNPQEKEQRDKLEENLKKIFKKIHDDVMKTSGRTNGAKARYGGDENFFKLREDWWTANRSTVWKAITCGTHDGASYFRATCSDGQSGAQAKNKCTCNNGDVPTYFDYVPQFLR'
      @tag = Bio::Sequence::AA.new(seq)
    end

    it "should return the number of cysteines" do
      @tag.cys_count.should == 4
    end

    it 'should return a dsid' do
      @tag.dsid.should == 'LYLV-LRED-KAIT-4-PTYF-126'
    end

    it 'should return the cyspolv group' do
      @tag.cyspolv_group.should == 4
    end

    it 'should return the length' do
      @tag.length.should == 126
    end

    it 'should return the start motif' do
      @tag.start_motif == 'YIGDI'
    end

    it 'should return false for var1' do
      @tag.is_var1? == false
    end

  end

  context 'a group2 Dbla tag' do
    before(:each) do
      seq = 'DIGDIVRGTDLFLGGPSQEKKKLEENLKKILENIKNKNTKLSTLTLEKVREYWWALNRNDVWKALTCSAPYEAQYFIKSSDKEHSFSSEYCGHHNNDDPLTNLDYVPQFLR'
      @tag = Bio::Sequence::AA.new(seq)
    end

    it 'should return the number of cysteines' do 
      @tag.cys_count.should == 2
    end

    it 'should return the block sharing group 1' do
      @tag.bs_group == 1
    end

    it 'should return false for cp2 var1' do
      @tag.is_var1_cp2? == false
    end


  end

  #create an instace of a new DBL-alpha tag. A dbla tag extends the Bio::Sequence::AA class with methods
  #to classify and describe Dbla properties

  #seq1 ='DIGDIVRGRDMFKSNPEVEKGLKAVFRKINNGLTPQAKTHYADEDGSGNYVKLREDWWKANRDQVWKAITCKAPQSVHYFIKTSHGTRGFTSHGKCGRNETNVPTNLDYVPQYLR'
  #seq2 = 'DIGDIIRGEDLYLGYDDEEKKQREQLEENLKKIFKEIYDNLMEDLKNDPTKNGAQNRCKDTKNYYQLREDWLALNRVQVWKAITCNAPENANYFKPAQNGTREFTNGHCGRNEEKVPTYLDYVPQYLR'
  #seq = Bio::Sequence::AA.new(seq1)

  #get the positions of limited variability
  #puts seq.polv1
  #puts seq.polv2
  #puts seq.polv3
  #puts seq.polv4

  #get the number if cysteines in the tag
  #puts seq.cys_count

  #get the distinct sequence identifier
  #puts seq.dsid

  #get the cyspolv group for this tag
  #puts seq.cyspolv_group


  #get the block sharing group for this tag
  #puts seq.bs_group #to be implemented

  #get the length of the tag
  #puts seq.size


  #get the pspb1
  #puts seq.pspb1

  #get the pspb2
  #puts seq.pspb2

  #get the pspb3
  #puts seq.pspb3

  #get the pspb4
  #puts seq.pspb4


  #if input file is a fasta file
  #seq_file = "#{ENV['HOME']}/sequences/878_kilifi_sequences.fasta"

  #read the file
  #Bio::FlatFile.open(seq_file).each do |entry|
  #tag = Bio::Sequence::AA.new(entry.seq)
  #puts "#{entry.definition},#{tag.dsid},#{tag.cys_count},#{tag.cyspolv_group}"
  #end
