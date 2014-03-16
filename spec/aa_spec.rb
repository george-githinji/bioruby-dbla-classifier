require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Dbla" do
  context 'Group4 Dbla tag' do
    before(:each) do
      seq1 = 'YIGDIIRGRDLYLVNPQEKEQRDKLEENLKKIFKKIHDDVMKTSGRTNGAKARYGGDENFFKLREDWWTANRSTVWKAITCGTHDGASYFRATCSDGQSGAQAKNKCTCNNGDVPTYFDYVPQFLR'
      seq2 = 'DIGDIVRGRDLYLGYDQKEKEQREKLEKNLKDIFGDIYEELTKNGKTLQERHGSDTTNYYKLREDWRTANRHTVWEALTCEAPESAHYFKPSENNTQYFSNKYCGRDEKKVPTNLDYVPQFLR'
      @tag = Bio::Sequence::AA.new(seq1)
      @tag2 = Bio::Sequence::AA.new(seq2)
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

    it 'should return the polv1 to polv2 part of the sequence' do
      @tag.polv1_to_polv2.should == 'LYLVNPQEKEQRDKLEENLKKIFKKIHDDVMKTSGRTNGAKARYGGDENFFKLRED'
    end

    it 'should return the polv3 to polv4 part of the sequence' do
      @tag.polv3_to_polv4.should == 'KAITCGTHDGASYFRATCSDGQSGAQAKNKCTCNNGDVPTYF'
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

    it 'should return other unless var1' do
      @tag2.var1_status.should == 'other'
    end
  end

  context 'mutations in tag' do
    before(:each) do
      seq = 'DIGDIVRGTDLFLGGPSQEKKKLEENLKKILENIKNKNTKLSTLTLEKVREYWWALNRNDVWKALTCSAPYEAQYFIKSSDKEHSFSSEYCGHHNNDDPLTNLDYVPQFLR'
      @tag3 = Bio::Sequence::AA.new(seq)
    end
    it 'should return the position of polv1' do
      @tag3.polv1_pos.should == 10
    end
  end

  context 'bs1 and bs2 in same sequence' do
    before(:each) do
      seq = 'DIGDDDDVEKGLKIVFEKREYWWPNKCRCEDANADQVVALKHYKDDTKNYYQPQFLR'
      @tag4 = Bio::Sequence::AA.new(seq)
    end
      it 'should return both bs1 and bs2 blocks if present in the same sequence' do
        @tag4.is_bs1_and_bs2?.should be_true
      end
  end
end
