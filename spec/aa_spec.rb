require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DBL-alpha sequence ta" do
  context 'A CP4 DBL-alpha tag' do
    before(:each) do
      seq1 = 'YIGDIIRGRDLYLVNPQEKEQRDKLEENLKKIFKKIHDDVMKTSGRTNGAKARYGGDENFFKLREDWWTANRSTVWKAITCGTHDGASYFRATCSDGQSGAQAKNKCTCNNGDVPTYFDYVPQFLR'
      seq2 = 'DIGDIVRGRDLYLGYDQKEKEQREKLEKNLKDIFGDIYEELTKNGKTLQERHGSDTTNYYKLREDWRTANRHTVWEALTCEAPESAHYFKPSENNTQYFSNKYCGRDEKKVPTNLDYVPQFLR'

      @tag  = Bio::Sequence::AA.new(seq1)
      @tag2 = Bio::Sequence::AA.new(seq2)
    end

    it "should return the number of cysteines" do
      expect(@tag.cys_count).to eq(4)
    end

    it 'should return a dsid' do
      expect(@tag.dsid).to eq('LYLV-LRED-KAIT-4-PTYF-126')
    end

    it 'should return the cyspolv group' do
      expect(@tag.cyspolv_group).to eq(4)
    end

    it 'should return the length' do
     expect(@tag.length).to eq(126)
    end

    it 'should return the start motif' do
      expect(@tag.start_motif).to eq('YIGDI')
    end

    it 'should return false if sequences is a var1' do
      expect(@tag.is_var1?).to be false
    end

    it 'should return the polv1 to polv2 part of the sequence' do
      expect(@tag.polv1_to_polv2).to eq('LYLVNPQEKEQRDKLEENLKKIFKKIHDDVMKTSGRTNGAKARYGGDENFFKLRED')
    end

    it 'should return the polv3 to polv4 part of the sequence' do
      expect(@tag.polv3_to_polv4).to eq('KAITCGTHDGASYFRATCSDGQSGAQAKNKCTCNNGDVPTYF')
    end
  end

  context 'groupA-like tags' do
    before(:each) do
    seq3 = 'DIGDIVRGKDMFKPNTVDKVQKGLKIVFQKINNSLNNRGIHNYDDDGPHYYKLREDWWTVNRNQVWEAITCGALPKSAYFMQSEDNKQLFSNPKCGHGDKDVPTNLDYVPQYLR'
    @tag3 = Bio::Sequence::AA.new(seq3)
    end

    it 'should be regarded as a groupA-like' do
     expect(@tag3.groupA_status).to eq('groupA_like')
    end

  end

  context 'CP2 DBL-alpha tags' do
    before(:each) do
      seq = 'DIGDIVRGTDLFLGGPSQEKKKLEENLKKILENIKNKNTKLSTLTLEKVREYWWALNRNDVWKALTCSAPYEAQYFIKSSDKEHSFSSEYCGHHNNDDPLTNLDYVPQFLR'
      @tag2 = Bio::Sequence::AA.new(seq)
    end

    it 'should return the number of cysteines' do
      expect(@tag2.cys_count).to eq(2)
    end

    it 'should return the block sharing group 1' do
      expect(@tag2.bs_group).to eq(1)
    end

    it 'should return false for cp2 var1' do
      expect(@tag2.is_var1_cp2?).to be false
    end

    it 'should return other unless var1' do
      expect(@tag2.var1_status).to eq('other')
    end
  end

  context 'mutations in tag' do
    before(:each) do
      seq = 'DIGDIVRGTDLFLGGPSQEKKKLEENLKKILENIKNKNTKLSTLTLEKVREYWWALNRNDVWKALTCSAPYEAQYFIKSSDKEHSFSSEYCGHHNNDDPLTNLDYVPQFLR'
      @tag3 = Bio::Sequence::AA.new(seq)
    end
    it 'should return the position of polv1' do
     expect(@tag3.polv1_pos).to eq(10)
    end
  end

  context 'bs1 and bs2 in same sequence' do
    before(:each) do
      seq = 'DIGDDDDVEKGLKIVFEKREYWWPNKCRCEDANADQVVALKHYKDDTKNYYQPQFLR'
      @tag4 = Bio::Sequence::AA.new(seq)
    end
      it 'should return both bs1 and bs2 blocks if present in the same sequence' do
        expect(@tag4.is_bs1_and_bs2?).to be true
      end
  end
end
