\version "2.18.2"
\language "english"

\header {
  title = "Stand by me"
  composer = "Ben E. King"
  tagline = \markup {
    Engraved on
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}

lskip = #(define-music-function (parser location count) (integer?) #{
  \repeat unfold $count { \skip 4 }
#})

song = #(define-music-function (parser location inTab) (boolean?) #{
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

    \new Staff \new Voice = "music" {
      \song ##f
    }
    \lyricsto "music" \new Lyrics {
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
