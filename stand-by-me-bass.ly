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

song = {
  \numericTimeSignature
  \tempo 4 = 120
  \time 4/4
  \key a \major
  \relative c {
    r4 a4 r8 a~ a4
    e8 gis a4 r8 a~ a4
    a8 gis fis4 r8 fis~ fis4
    e fis4 r8 fis~ fis4
    fis8 e d4 r8 d~ d4
    d8 fis e4 r8 e~ e4
    \break
    \repeat volta 10 {
      e8 gis a4 r8 a~ a4
      e8 gis a4 r8 a~ a4
      e8 gis a4 r8 a~ a4
      e8 gis a4 r8 a~ a4
      a8 gis fis4 r8 fis~ fis4
      e fis4 r8 fis~ fis4
      fis8 e d4 r8 d~ d4
      d8 fis e4 r8 e~ e4
      e8 gis a4 r8 a~ a4
    }
    \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
    \mark \markup \tiny "10×"
  }
}

staff = #(define-music-function (scoreOnly tabOnly) (boolean? boolean?) #{
  \new StaffGroup \with {
    instrumentName = #"Bass"
    midiInstrument = #"electric bass (finger)"
  } <<
      #(if (not tabOnly) #{
        \new Staff {
          \clef "bass_8"
          \song
        }
      #})
      #(if (not scoreOnly) #{
        \new TabStaff \with {
          stringTunings = #bass-tuning
          minimumFret = #5
          restrainOpenStrings = ##t
        } {
          \clef "moderntab"
          #(if tabOnly #{
            \tabFullNotation
            \stemDown
          #})
          \song
        }
      #})
  >>
#})

\book {
  \score {
    \staff ##f ##f
    \layout {
      \omit Voice.StringNumber
    }
  }

  \score {
    \unfoldRepeats \staff ##f ##f
    \midi { }
  }
}

\book {
  \bookOutputSuffix "score-only"

  \paper {
    markup-system-spacing.padding = #5
    system-system-spacing.padding = #8
  }

  \score {
    \staff ##t ##f
    \layout {
      \omit Voice.StringNumber
    }
  }
}

\book {
  \bookOutputSuffix "tab-only"

  \paper {
    markup-system-spacing.padding = #12
    system-system-spacing.padding = #8
  }

  \score {
    \staff ##f ##t
    \layout {
      \omit Voice.StringNumber
    }
  }
}
