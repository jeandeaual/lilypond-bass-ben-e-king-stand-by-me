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

#(set-global-staff-size 30)

\paper {
  markup-system-spacing.padding = #4
  system-system-spacing.padding = #6
}

lskip = #(define-music-function (count) (integer?) #{
  \repeat unfold $count { \skip 4 }
#})

song = #(define-music-function (inTab) (boolean?) #{
  \numericTimeSignature
  \tempo 4 = 120
  \clef #(if inTab "moderntab" "bass_8")
  \time 4/4
  \key a \major
  \relative c {
    a4 r8 a~ a4 e8 gis
    a4 r8 a~ a4 a8 gis
    fis4 r8 fis~ fis4 e
    fis4 r8 fis~ fis4 fis8 e
    % 5
    d4 r8 d~ d4 d8 fis
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
  \new StaffGroup \with {
    instrumentName = #"Bass"
    midiInstrument = #"electric bass (finger)"
  } <<
    \new Staff {
      \song ##f
    }
    %{\addlyrics {
      \lskip #29
      When the night has come and the land is dark
      and the moon is the on -- ly ___ light we'll see
    }%}
    \new TabStaff \with {
      stringTunings = #bass-tuning
      minimumFret = #5
      restrainOpenStrings = ##t
    } {
      \song ##t
    }
  >>
  \layout {
    \omit Voice.StringNumber
  }
  \midi { }
}
