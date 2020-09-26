\version "2.20.0"
\language "english"

\header {
  title = "Stand by Me"
  composer = "Ben E. King"
  tagline = ##f
}

lskip = #(define-music-function (count) (integer?) #{
  \repeat unfold $count { \skip 4 }
#})

song = #(define-music-function (inTab) (boolean?) #{
  \tempo 4 = 120
  \clef #(if inTab "tab" "bass_8")
  \time 4/4
  \relative c {
    a4\2 r8 a~\2 a4 e8\3 gs\2
    a4\2 r8 a~\2 a4 a8\2 gs\2
    fs4 r8 fs~ fs4 e\3
    fs4 r8 fs~ fs4 fs8 e
    d4\3 r8 d~\3 d4 d8\3 fs\3
    e4\3 r8 e~\3 e4 e8\3 gs\2
    a4\2 r8 a~\2 a4 e8\3 gs\2
    a4\2 r8 a~\2 a4 e8\3 gs\2
    a4\2 r8 a~\2 a4 e8\3 gs\2
    a4\2 r8 a~\2 a4 a8\2 gs\2
    fs4 r8 fs~ fs4 e\3
    fs4 r8 fs~ fs4 fs8 e
    d4\3 r8 d~\3 d4 d8\3 fs\3
    e4\3 r8 e~\3 e4 e8\3 gs\2
    a4\2 r8 a~\2 a4 e8\3 gs\2
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
