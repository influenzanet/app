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
            // {
            //   "role": "input",
            //   "content": [
            //     {
            //       "code": "en",
            //       "parts": ["Other: "]
            //     },
            //     {
            //       "code": "de",
            //       "parts": ["Andere:"]
            //     }
            //   ],
            //   "key": "2.0"
            // },
            {
              "role": "singleChoiceGroup",
              "key": "1.1",
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
                  "key": "1.1.0"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["Paid employment, full-time"]
                    },
                    {
                      "code": "de",
                      "parts": ["Bezahlte Beschäftigung, Vollzeit"]
                    }
                  ],
                  "key": "1.1.1"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["Paid employment, part-time"]
                    },
                    {
                      "code": "de",
                      "parts": ["Bezahlte Beschäftigung, Teilzeit"]
                    }
                  ],
                  "key": "1.1.2"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": [
                        "Self-employed (businessman, farmer, tradesman, etc)"
                      ]
                    },
                    {
                      "code": "de",
                      "parts": [
                        "Selbstständige (Geschäftsleute, Landwirte, Handwerker usw.)"
                      ]
                    }
                  ],
                  "key": "1.1.3"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["Attending daycare/school/college/university"]
                    },
                    {
                      "code": "de",
                      "parts": [
                        "Besuch von Kindertagesstätten/Schulen/Hochschulen/Universitäten"
                      ]
                    }
                  ],
                  "key": "1.1.4"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["Home-maker (e.g. housewife)"]
                    },
                    {
                      "code": "de",
                      "parts": ["Haushaltsführung (z.B. Hausfrau)"]
                    }
                  ],
                  "key": "1.1.5"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["Unemployed"]
                    },
                    {
                      "code": "de",
                      "parts": ["Arbeitslos"]
                    }
                  ],
                  "key": "1.1.6"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["Long-term sick-leave or parental leave"]
                    },
                    {
                      "code": "de",
                      "parts": [
                        "Langfristiger Krankheitsurlaub oder Elternurlaub"
                      ]
                    }
                  ],
                  "key": "1.1.7"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["Retired"]
                    },
                    {
                      "code": "de",
                      "parts": ["Im Ruhestand"]
                    }
                  ],
                  "key": "1.1.8"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["Other"]
                    },
                    {
                      "code": "de",
                      "parts": ["Sonstige"]
                    }
                  ],
                  "key": "1.1.9"
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
  },
  {
    "key": "0.5.5",
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
                "Except people you meet on public contact, do you have contact with any of the following during the course of a typical day?"
              ]
            },
            {
              "code": "de",
              "parts": [
                "Abgesehen von Menschen, denen Sie in der Öffentlichkeit begegnen, haben Sie im Laufe eines typischen Tages Kontakt mit einer der folgenden Personengruppen?"
              ]
            }
          ]
        },
        {
          "role": "text",
          "content": [
            {
              "code": "en",
              "parts": ["Select all options that apply, if any"]
            },
            {
              "code": "de",
              "parts": [
                "Wählen Sie alle entsprechenden Optionen aus, falls diese zutreffen"
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
              ],
              "style": [
                {"key": "abc", "value": "abc"}
              ]
            },
            {
              "role": "text",
              "content": [
                {
                  "code": "en",
                  "parts": [
                    "To find out whether you are likely to be exposed to more flu than the average person (e.g. work with children, or patients)"
                  ]
                },
                {
                  "code": "de",
                  "parts": [
                    "Um herauszufinden, ob Sie voraussichtlich stärker der Grippe ausgesetzt sind als der Durchschnittsbürger (z.B. bei der Arbeit mit Kindern oder Patienten)"
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
                    "Groups of people could include any setting where you come into contact with large numbers of people at once, e.g. a teacher who may contact many children in a day"
                  ]
                },
                {
                  "code": "de",
                  "parts": [
                    "Personengruppen können jede Situation umfassen, in der Sie mit einer großen Anzahl von Menschen gleichzeitig in Kontakt kommen, z.B. ein Lehrer, der an einem Tag mit vielen Kindern in Kontakt kommen kann"
                  ]
                }
              ]
            }
          ],
          "order": {"name": "sequential"}
        },
        {
          "role": "warning",
          "displayCondition": true,
          "content": [
            {
              "code": "en",
              "parts": ["Invalid input data"]
            },
            {
              "code": "de",
              "parts": ["Ungültige Eingabe"]
            }
          ]
        },
        {
          "role": "responseGroup",
          "key": "5",
          "items": [
            {
              "role": "multipleChoiceGroup",
              "key": "1.1",
              "items": [
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": [
                        "More than 10 children or teenagers over the course of the day"
                      ]
                    },
                    {
                      "code": "de",
                      "parts": [
                        "Mehr als 10 Kinder oder Jugendliche im Laufe des Tages"
                      ]
                    }
                  ],
                  "key": "1.1.1"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": [
                        "More than 10 people aged over 65 over the course of day"
                      ]
                    },
                    {
                      "code": "de",
                      "parts": [
                        "Mehr als 10 Personen im Alter von über 65 Jahren im Laufe des Tages"
                      ]
                    }
                  ],
                  "key": "1.1.2"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["Patients"]
                    },
                    {
                      "code": "de",
                      "parts": ["Patientinnen und Patienten"]
                    }
                  ],
                  "key": "1.1.3"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": [
                        "Groups of people (more than 10 individuals at any one time)"
                      ]
                    },
                    {
                      "code": "de",
                      "parts": [
                        "Personengruppen (mehr als 10 Personen zu einem beliebigen Zeitpunkt)"
                      ]
                    }
                  ],
                  "key": "1.1.4"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["None of the above"]
                    },
                    {
                      "code": "de",
                      "parts": ["Keine der oben genannten"]
                    }
                  ],
                  "key": "1.1.5"
                }
              ],
              "order": {"name": "sequential"}
            }
          ],
          "order": {"name": "sequential"}
        }
      ],
      "order": {"name": "sequential"}
    },
    "validations": [
      {"rule": true, "type": "soft", "key": "V1"}
    ]
  },
  {
    "key": "0.5.5b",
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
                "Except people you meet on public contact, do you have contact with any of the following during the course of a typical day?"
              ]
            },
            {
              "code": "de",
              "parts": [
                "Abgesehen von Menschen, denen Sie in der Öffentlichkeit begegnen, haben Sie im Laufe eines typischen Tages Kontakt mit einer der folgenden Personengruppen?"
              ]
            }
          ]
        },
        {
          "role": "text",
          "content": [
            {
              "code": "en",
              "parts": ["Select all options that apply, if any"]
            },
            {
              "code": "de",
              "parts": [
                "Wählen Sie alle entsprechenden Optionen aus, falls diese zutreffen"
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
                    "To find out whether you are likely to be exposed to more flu than the average person (e.g. work with children, or patients)"
                  ]
                },
                {
                  "code": "de",
                  "parts": [
                    "Um herauszufinden, ob Sie voraussichtlich stärker der Grippe ausgesetzt sind als der Durchschnittsbürger (z.B. bei der Arbeit mit Kindern oder Patienten)"
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
                    "Groups of people could include any setting where you come into contact with large numbers of people at once, e.g. a teacher who may contact many children in a day"
                  ]
                },
                {
                  "code": "de",
                  "parts": [
                    "Personengruppen können jede Situation umfassen, in der Sie mit einer großen Anzahl von Menschen gleichzeitig in Kontakt kommen, z.B. ein Lehrer, der an einem Tag mit vielen Kindern in Kontakt kommen kann"
                  ]
                }
              ]
            }
          ],
          "order": {"name": "sequential"}
        },
        {
          "role": "responseGroup",
          "key": "6",
          "items": [
            {
              "role": "multipleChoiceGroup",
              "key": "1.1",
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
                  "key": "1.1.0"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": [
                        "More than 10 children or teenagers over the course of the day"
                      ]
                    },
                    {
                      "code": "de",
                      "parts": [
                        "Mehr als 10 Kinder oder Jugendliche im Laufe des Tages"
                      ]
                    }
                  ],
                  "key": "1.1.1"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": [
                        "More than 10 people aged over 65 over the course of day"
                      ]
                    },
                    {
                      "code": "de",
                      "parts": [
                        "Mehr als 10 Personen im Alter von über 65 Jahren im Laufe des Tages"
                      ]
                    }
                  ],
                  "key": "1.1.2"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["Patients"]
                    },
                    {
                      "code": "de",
                      "parts": ["Patientinnen und Patienten"]
                    }
                  ],
                  "key": "1.1.3"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": [
                        "Groups of people (more than 10 individuals at any one time)"
                      ]
                    },
                    {
                      "code": "de",
                      "parts": [
                        "Personengruppen (mehr als 10 Personen zu einem beliebigen Zeitpunkt)"
                      ]
                    }
                  ],
                  "key": "1.1.4"
                },
                {
                  "role": "option",
                  "content": [
                    {
                      "code": "en",
                      "parts": ["None of the above"]
                    },
                    {
                      "code": "de",
                      "parts": ["Keine der oben genannten"]
                    }
                  ],
                  "key": "1.1.5"
                }
              ],
              "order": {"name": "sequential"}
            }
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
