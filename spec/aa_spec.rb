require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Dbla" do
  context 'Group4 Dbla tag' do
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
      @tag.start_motif.should == 'YIGDI'
    end

    it 'should return false for var1' do
      @tag.is_var1?.should be_false
    end

  end

  context 'Group2 Dbla tag' do
    before(:each) do
      seq = 'DIGDIVRGTDLFLGGPSQEKKKLEENLKKILENIKNKNTKLSTLTLEKVREYWWALNRNDVWKALTCSAPYEAQYFIKSSDKEHSFSSEYCGHHNNDDPLTNLDYVPQFLR'
      @tag2 = Bio::Sequence::AA.new(seq)
    end

    it 'should return the number of cysteines' do 
      @tag2.cys_count.should == 2
    end

    it 'should return the block sharing group 1' do
      @tag2.bs_group.should == 1
    end

    it 'should return false for cp2 var1' do
      @tag2.is_var1_cp2?.should be_false
    end
  end
end
