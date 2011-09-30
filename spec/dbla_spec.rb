require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Dbla" do
  context 'a group4 Dbla tag' do
   before(:each) do
    seq = 'YIGDIIRGRDLYLVNPQEKEQRDKLEENLKKIFKKIHDDVMKTSGRTNGAKARYGGDENFFKLREDWWTANRSTVWKAITCGTHDGASYFRATCSDGQSGAQAKNKCTCNNGDVPTYFDYVPQFLR'
    @tag = Dbla.new(seq)
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

 end
end

