const qp = [
  {
    "key": "0.4.4",
    "version": 1,
    "components": {
      "role": "root",
      "items": [
        {
          "role": "title",
          "content": [
            {
              "code": "en",
              "parts": ["What is your main activity?"]
            },
            {
              "code": "de",
              "parts": ["Was ist Ihre Haupttätigkeit?"]
            }
          ]
        },
        {
          "role": "helpGroup",
          "items": [
            {
              "role": "text",
              "content": [
                {
                  "code": "en",
                  "parts": ["Why are we asking this?"]
                },
                {
                  "code": "de",
                  "parts": ["Warum fragen wir das?"]
                }
              ]
            },
            {
              "role": "text",
              "content": [
                {
                  "code": "en",
                  "parts": [
                    "To check how representative our sample is compared to the population as a whole, and to find out whether the chance of getting flu is different for people in different types of occupation."
                  ]
                },
                {
                  "code": "de",
                  "parts": [
                    "Um zu überprüfen, wie repräsentativ unsere Stichprobe im Vergleich zur Gesamtbevölkerung ist, und um herauszufinden, ob die Chance, eine Grippe zu bekommen, für Menschen in verschiedenen Berufsfeldern unterschiedlich hoch ist."
                  ]
                }
              ]
            },
            {
              "role": "text",
              "content": [
                {
                  "code": "en",
                  "parts": ["How should I answer it?"]
                },
                {
                  "code": "de",
                  "parts": ["Wie soll ich darauf antworten?"]
                }
              ]
            },
            {
              "role": "text",
              "content": [
                {
                  "code": "en",
                  "parts": [
                    "Please tick the box that most closely resembles your main occupation. For pre-school children who don’t go to daycare tick the “other” box."
                  ]
                },
                {
                  "code": "de",
                  "parts": [
                    "Bitte kreuzen Sie das Kästchen an, das Ihrer Hauptbeschäftigung am nächsten kommt. Bei Vorschulkindern, die nicht in die Kindertagesstätte gehen, kreuzen Sie bitte das Kästchen \"andere\" an."
                  ]
                }
              ]
            }
          ],
          "order": {"name": "sequential"}
        },
        {
          "role": "responseGroup",
          "key": "4",
          "items": [
            {
              "role": "input",
              "content": [
                {
                  "code": "en",
                  "parts": ["Other: "]
                },
                {
                  "code": "de",
                  "parts": ["Andere:"]
                }
              ],
              "key": "2.0"
            },
          ],
          "order": {"name": "sequential"}
        }
      ],
      "order": {"name": "sequential"}
    },
    "validations": []
  },
  {
    "key": "0.6.6",
    "version": 1,
    "components": {
      "role": "root",
      "items": [
        {
          "role": "title",
          "content": [
            {
              "code": "en",
              "parts": [
                "INCLUDING YOU, how many people in each of the following age groups live in your household?"
              ]
            },
            {
              "code": "de",
              "parts": [
                "EINSCHLIESSLICH IHNEN, wie viele Personen aus jeder der folgenden Altersgruppen leben in Ihrem Haushalt?"
              ]
            }
          ]
        },
        {
          "role": "helpGroup",
          "items": [
            {
              "role": "text",
              "content": [
                {
                  "code": "en",
                  "parts": ["Why are we asking this?"]
                },
                {
                  "code": "de",
                  "parts": ["Warum fragen wir das?"]
                }
              ]
            },
            {
              "role": "text",
              "content": [
                {
                  "code": "en",
                  "parts": [
                    "Members of larger households, or those with children, may be more likely to catch flu than others."
                  ]
                },
                {
                  "code": "de",
                  "parts": [
                    "Mitglieder größerer Haushalte oder solche mit Kindern können sich mit größerer Wahrscheinlichkeit an der Grippe anstecken als andere."
                  ]
                }
              ]
            },
            {
              "role": "text",
              "content": [
                {
                  "code": "en",
                  "parts": ["How should I answer it?"]
                },
                {
                  "code": "de",
                  "parts": ["Wie soll ich darauf antworten?"]
                }
              ]
            },
            {
              "role": "text",
              "content": [
                {
                  "code": "en",
                  "parts": [
                    "A household is defined as a group of people (not necessarily related) living at the same address who share cooking facilities and share a living room, sitting room or dining area."
                  ]
                },
                {
                  "code": "de",
                  "parts": [
                    "Ein Haushalt ist definiert als eine Gruppe von Personen (nicht notwendigerweise miteinander verwandt), die an derselben Adresse wohnen, sich die Kochgelegenheit und ein Wohnzimmer, einen Aufenthaltsraum oder einen Essbereich teilen."
                  ]
                }
              ]
            }
          ],
          "order": {"name": "sequential"}
        },
        {
          "role": "responseGroup",
          "key": "7",
          "items": [
            {
              "role": "dropDownGroup",
              "content": [
                {
                  "code": "en",
                  "parts": ["0-4 years"]
                },
                {
                  "code": "de",
                  "parts": ["0-4 Jahre"]
                }
              ],
              "description": [
                {
                  "code": "en",
                  "parts": ["description"]
                },
                {
                  "code": "de",
                  "parts": ["description"]
                }
              ],
              "key": "1.1",
              "items": [
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["0"]
                    },
                    {
                      "code": "de",
                      "parts": ["0"]
                    }
                  ],
                  "key": "1.1.1"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["1"]
                    },
                    {
                      "code": "de",
                      "parts": ["1"]
                    }
                  ],
                  "key": "1.1.2"
                }
              ],
              "order": {"name": "sequential"}
            },
          ],
          "order": {"name": "sequential"}
        }
      ],
      "order": {"name": "sequential"}
    },
    "validations": []
  }
];
