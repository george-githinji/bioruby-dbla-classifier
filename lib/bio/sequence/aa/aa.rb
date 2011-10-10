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

 def dsid
   "#{polv1}-#{polv2}-#{polv3}-#{cys_count.to_s}-#{polv4}-#{self.length}"
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
  if self =~ /WW/
   polv2 = self[ww_pos - 4,4]
  elsif self =~ /VW/
   polv2 = self[vw_pos - 12,4]
  else
  end
  polv2
 end

 #The third position of limited variability(polv3)
 def polv3
  if self =~ /WW/
   polv3 = self[ww_pos + 10,4]
  elsif self =~ /VW/
   polv3 = self[vw_pos + 2,4]
  else
  end
  polv3
 end

 #The fourth position of limited variability(polv4)
 def polv4
  self[self.length - 12,4]
 end

 #Assigning dsid group based on cysteines coun and presence of
 #REY motif in polv2, MFK in polv1,
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

 private

 def accepted_length
   100..168
 end

end


#create an instace of a new DBL-alpha tag. A dbla tag extends the Bio::Sequence::AA class with methods
#to classify and describe Dbla properties

#seq1 = 'DIGDIIRGRDLYSGNNKEKEQRKKLEKNGKTIVGKIYNEATNGQALQARYKGDDNNNYSKLREDRWTANRATIWEAITCDDDNKLSNASYVRPTSTDGQSGAQGKDKCRSANKTTGNTGDVNIVPTYFDYVPQYLR'
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

#if input file is a fasta file
 seq_file = "#{ENV['HOME']}/sequences/878_kilifi_sequences.fasta"

#read the file
 Bio::FlatFile.open(seq_file).each do |entry|
  tag = Bio::Sequence::AA.new(entry.seq)
  puts tag.start_motif
  puts tag.end_motif
  #puts "#{entry.definition},#{tag.dsid},#{tag.cys_count},#{tag.cyspolv_group}"
 end
