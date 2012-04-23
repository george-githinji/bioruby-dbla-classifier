class Bio::Sequence::NA

  #position specific polymorphic block 1
  def pspb1_as_dna(anchor_pos=0,win_len=42)
    self[42 + anchor_pos,win_len]
  end

  #position specific polymorphic block 2
  def pspb2_as_dna(anchor_pos=0,win_len=42)
    if !ww_missing?
      return self[(ww_pos * 3) - 12 - anchor_pos - win_len, win_len]
    elsif !vw_missing?
      return self[(vw_pos * 3) - 36 - win_len - anchor_pos, win_len]
    else
      return '....'
    end
  end

  #position specific polymorphic block 3
  def pspb3_as_dna(anchor_pos=0,win_len=42)
    if !ww_missing?
      return self[(ww_pos * 3) + 42 + anchor_pos, win_len]
    elsif !vw_missing?
      return self[(vw_pos * 3) + 8 + anchor_pos, win_len]
    else
      return '....'
    end
  end

  #position specific polymorphic block 4
  def pspb4_as_dna(anchor_pos=0,win_len=42)
    self[self.length - 36 - win_len - anchor_pos, win_len]
  end

  private
  def accepted_length
    300..500
  end

  def aa_seq
    self.translate
  end

  def ww_pos
    aa_seq.rindex("WW")
  end

  def vw_pos
    aa_seq.rindex("VW")
  end

  def ww_missing?
    true unless aa_seq =~ /WW/i
  end

  def vw_missing?
    true unless aa_seq =~ /VW/i
  end

  def vw_ww_missing?
    true if ww_missing? && vw_missing?
  end
end
