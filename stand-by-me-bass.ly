\version "2.20.0"

\header {
  title = "Stand by Me"
  composer = "Ben E. King"
  author = \markup \fromproperty #'header:composer
  subject = \markup \concat { \fromproperty #'header:title " Bass Partition" }
  keywords = #(string-join '(
    "music"
    "partition"
    "bass"
  ) ", ")
  tagline = ##f
}

lskip = #(define-music-function (count) (integer?) #{
  \repeat unfold $count { \skip 4 }
#})

song = #(define-music-function (inTab) (boolean?) #{
  \tempo 4 = 120
  \clef #(if inTab "moderntab" "bass_8")
  \time 4/4
  \key a \major
  \relative c {
    \set TabStaff.minimumFret = #4
    \set TabStaff.restrainOpenStrings = ##t
    a4 r8 a~ a4 e8 gis
    a4 r8 a~ a4 a8 gis
    fis4 r8 fis~ fis4 e
    fis4 r8 fis~ fis4 fis8 e
    % 5
    d4 r8 d~ d4 d8 fis\2
    e4 r8 e~ e4 e8 gis
    a4 r8 a~ a4 e8 gis
    a4 r8 a~ a4 e8 gis
    a4 r8 a~ a4 e8 gis
    % 10
    a4 r8 a~ a4 a8 gis
    fis4 r8 fis~ fis4 e
    fis4 r8 fis~ fis4 fis8 e
    d4 r8 d~ d4 d8 fis
    e4 r8 e~ e4 e8 gis
    % 15
    a4 r8 a~ a4 e8 gis
  }
#})

\score {
  \new StaffGroup <<
    \set StaffGroup.instrumentName = #"Bass"
    \set StaffGroup.midiInstrument = #"electric bass (finger)"

    \new Staff {
      \song ##f
    }
    \addlyrics {
      \lskip #29
      When the night has come and the land is dark
      and the moon is the on -- ly ___ light we'll see
    }
    \new TabStaff {
      \set TabStaff.stringTunings = #bass-tuning
      \song ##t
    }
  >>
  \layout {
    \omit Voice.StringNumber
  }
  \midi { }
}
