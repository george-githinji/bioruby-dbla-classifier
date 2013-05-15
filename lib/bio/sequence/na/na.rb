class Bio::Sequence::NA
  attr_accessor :mut_pos

  #position specific polymorphic block 1
  def pspb1_dna(anchor_pos=0,win_len=42)
    self[42 + anchor_pos,win_len]
  end

  #position specific polymorphic block 2
  def pspb2_dna(anchor_pos=0,win_len=42)
    if !ww_missing?
      return self[(ww_pos * 3) - 12 - anchor_pos - win_len, win_len]
    elsif !vw_missing?
      return self[(vw_pos * 3) - 36 - win_len - anchor_pos, win_len]
    else
      return '....'
    end
  end

  #position specific polymorphic block 3
  def pspb3_dna(anchor_pos=0,win_len=42)
    if !ww_missing?
      return self[(ww_pos * 3) + 42 + anchor_pos, win_len]
    elsif !vw_missing?
      return self[(vw_pos * 3) + 8 + anchor_pos, win_len]
    else
      return '....'
    end
  end

  #position specific polymorphic block 4
  def pspb4_dna(anchor_pos=0,win_len=42)
    self[self.length - 36 - win_len - anchor_pos, win_len]
  end

  def polv1_dna_pos
    mut_pos.map{|mut| mut - (aa_seq.polv1_pos * 3)}
  end

  def polv2_dna_pos
    mut_pos.map{|mut| mut - (aa_seq.polv2_pos * 3)}
  end

  def polv3_dna_pos
    mut_pos.map{|mut| mut - (aa_seq.polv3_pos * 3)}
  end

  def polv4_dna_pos
    mut_pos.map{|mut| mut - (aa_seq.polv4_pos * 3)}
  end

  #return an array of distances from each polv
  def dist_from_polvs
    [polv1_dna_pos, polv2_dna_pos, polv3_dna_pos, polv4_dna_pos]
  end

  #return the homology block D
  def homology_block_D
    self[0,36]
  end


  private
  def accepted_length
    aa_seq.accepted_length #300..500
  end

  def aa_seq
    self.translate
  end

  def ww_pos
    aa_seq.ww_pos #rindex("WW")
  end

  def vw_pos
    aa_seq.vw_pos #rindex("VW")
  end

  def ww_missing?
    aa_seq.ww_missing? #true unless aa_seq =~ /WW/i
  end

  def vw_missing?
    aa_seq.vw_missing? #true unless aa_seq =~ /VW/i
  end

  def vw_ww_missing?
    aa_seq.vw_ww_missing? #true if ww_missing? && vw_missing?
  end
end
