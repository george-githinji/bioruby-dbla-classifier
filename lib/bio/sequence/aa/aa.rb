class Bio::Sequence::AA

 def has_accepted_length?
   true if accepted_length.include? self.length
 end

 def start_motif
  self[0,5]
 end

 def end_motif
  self[-5,self.length]
 end

 def ww_pos
  rindex("WW")
 end

 def vw_pos
  rindex("VW")
 end

 #number of cysteines
 def cys_count
  scan(/C/).size
 end

 #The first position of limited variability(polv1)
 def polv1
  self[10,4]
 end

 #The second position of limited variability(polv2)
 def polv2
  if !ww_missing?
   return self[ww_pos - 4,4]
  elsif !vw_missing?
   return self[vw_pos - 12,4]
  else
   return '....'
  end
 end

 #The third position of limited variability(polv3)
 def polv3
  if !ww_missing?
    return self[ww_pos + 10,4]
  elsif !vw_missing?
    return self[vw_pos + 2,4]
  else
    return '....'
  end
 end

 #The fourth position of limited variability(polv4)
 def polv4
  self[self.length - 12,4]
 end

 #Assigning dsid group based on number of cysteines, presence of REY motif in polv2 and MFK in polv1,
 def cyspolv_group
  case
   when cys_count > 4 || cys_count == 3 || cys_count < 2
    group = 6
   when cys_count == 4 && polv2 =~ /REY/i
    group = 5
   when cys_count == 4
    group = 4
   when cys_count == 2 && polv1 =~ /MFK/i
    group = 1
   when cys_count == 2 && polv2 =~ /REY/i
    group =2
   else
    group = 3
  end
  group
 end

 def var1_cp1?
   return true if cyspolv_group == 1 && seq =~ /NVHDKVEKGLREVF|NVHDKVETGLREVF/
 end

 def var1_cp2?
   return true if cyspolv_group == 2 && self =~ /APNKEKIKLEENLKK/
 end

 def is_var1?
   return true if var1_cp1 || var1_cp2 
 end


#assign var1 and recode the $cys_PoLV_group to 999 for those that are var1
#if ($cys_PoLV_group ==1) {if ($seq=~ /NVHDKVEKGLREVF|NVHDKVETGLREVF/) {$var1_cp1=1; $cys_PoLV_group=999;}}
#if ($cys_PoLV_group ==2) {if ($seq=~ /APNKEKIKLEENLKK/) {$var1_cp2=1;$cys_PoLV_group=999}}

 
 #distict sequence identifier(DSID)
 def dsid
   "#{polv1}-#{polv2}-#{polv3}-#{cys_count.to_s}-#{polv4}-#{self.length}"
 end

 #position specific polymorphic block 1
 def pspb1(anchor_pos=0,win_len=14)
  self[14 + anchor_pos,win_len]
 end

 #position specific polymorphic block 2
 def pspb2(anchor_pos=0,win_len=14)
  if !ww_missing?
   return self[ww_pos - 4 - anchor_pos - win_len, win_len]
  elsif !vw_missing?
   return self[vw_pos - 12 - win_len - anchor_pos, win_len]
  else
    return '....'
  end
 end

 #position specific polymorphic block 3
 def pspb3(anchor_pos=0,win_len=14)
  if !ww_missing?
    return self[ww_pos + 14 + anchor_pos, win_len]
  elsif !vw_missing?
    return self[vw_pos + 6 + anchor_pos, win_len]
  else
    return '....'
  end
 end

 #position specific polymorphic block 4
 def pspb4(anchor_pos=0,win_len=14)
  self[self.length - 12 - win_len - anchor_pos, win_len]
 end

 private
 def accepted_length
   100..168
 end

 def ww_missing?
   true unless self =~ /WW/i
 end

 def vw_missing?
   true unless self =~ /VW/i
 end

 def no_vw_ww?
   true if ww_missing? && vw_missing?
 end
end
