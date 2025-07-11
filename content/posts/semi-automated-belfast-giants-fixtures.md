+++
title = 'Semi Automated Belfast Giants Fixtures'
date = 2025-07-11T15:42:05+01:00
draft = false
tags = ["belfast giants", "hockey", "automation", "google calendar"]
+++

# Semi-Automated Workflow to Add Belfast Giants Fixtures to Google Calendar..

This guide walks you through extracting all upcoming fixtures from the [Belfast Giants Game Centre](https://www.belfastgiants.com/game-centre), saving them to a CSV file, and importing them into Google Calendar — **no login, APIs, or scraping frameworks required!**

---

## What You’ll Need..

- Firefox or Chrome
- Python 3 installed
- Basic terminal access (Linux/BSD, Haiku or macOS )

---

## Step 1: Extract Fixtures in the Browser..

1. Open the [Belfast Giants Game Centre.](https://www.belfastgiants.com/game-centre)
3. Press **F12** to open **DevTools**, then go to the **Console** tab.
4. Paste in the JavaScript below and press **Enter**.

```js
(() => {
  const fixtures = [];
  const gameDetails = document.querySelectorAll('.matchMonth__game--details');

  gameDetails.forEach(details => {
    const homeAway = details.querySelector('.homeAway')?.innerText.trim() || 'UNKNOWN';
    const competition = details.querySelector('.matchMonth__competition')?.innerText.trim() || 'UNKNOWN';

    const pTag = details.querySelector('p');
    const strong = pTag?.querySelector('strong')?.innerText.trim() || 'NO DATE/TIME';
    const venue = pTag ? pTag.innerText.replace(strong, '').trim() : 'NO VENUE';

    const teamsContainer = details.nextElementSibling;
    if (!teamsContainer?.classList.contains('matchMonth__game--teams')) return;

    const teamDivs = teamsContainer.querySelectorAll('.nameLogo');
    const team1 = teamDivs[0]?.querySelector('h4')?.innerText.trim() || 'Team 1 missing';
    const team2 = teamDivs[1]?.querySelector('h4')?.innerText.trim() || 'Team 2 missing';

    fixtures.push(`${strong} — ${competition} — ${homeAway} — ${team1} VS ${team2} — Venue: ${venue}`);
  });

  const output = fixtures.join('\n');
  console.log(output);

  // Also download as a file
  const blob = new Blob([output], { type: "text/plain" });
  const a = document.createElement("a");
  a.href = URL.createObjectURL(blob);
  a.download = "giantsfixtures.txt";
  a.click();
})();
```

This downloads a file named **`giantsfixtures.txt`** with clean formatting for each fixture.

---

## Step 2: Convert Fixtures to Google Calendar Format..

Save the script below as `fixtures.py`, make it executable with `chmod +x fixtures.py` & finally fun it `python3 fixtures.py`. This creates a file called `giantsfixtures.csv`.

```python
#!/usr/bin/env python3

import csv
import re
from datetime import datetime, timedelta

input_file = "/home/YOURNAME/giantsfixtures.txt"  # adjust path as needed
output_file = "/home/YOURNAME/giantsfixtures.csv"

def parse_fixture_line(line):
    parts = line.split('—')
    if len(parts) < 5:
        return None

    date_time_str = parts[0].strip()
    competition = parts[1].strip()
    home_away = parts[2].strip()
    teams = parts[3].strip()
    venue = parts[4].replace('Venue:', '').strip()

    # Clean suffix from day (e.g., 7th → 7)
    date_time_str = re.sub(r'(\d{1,2})(st|nd|rd|th)', r'\1', date_time_str)
    date_time_str = re.sub(r'^[A-Za-z]+\s+', '', date_time_str)

    year = datetime.now().year
    try:
        dt = datetime.strptime(f"{date_time_str} {year}", "%d %B, %I:%M%p %Y")
    except ValueError:
        try:
            dt = datetime.strptime(f"{date_time_str} {year}", "%d %B %I:%M%p %Y")
        except ValueError:
            print(f"⚠️ Could not parse date: {date_time_str}")
            return None

    return {
        'Subject': f"{teams} ({home_away})",
        'Start Date': dt.strftime("%Y/%m/%d"),
        'Start Time': dt.strftime("%H:%M"),
        'End Date': dt.strftime("%Y/%m/%d"),
        'End Time': (dt + timedelta(hours=2)).strftime("%H:%M"),
        'All Day Event': 'FALSE',
        'Description': competition,
        'Location': venue
    }

with open(input_file, 'r', encoding='utf-8') as fin, open(output_file, 'w', newline='', encoding='utf-8') as fout:
    writer = csv.DictWriter(fout, fieldnames=[
        'Subject', 'Start Date', 'Start Time', 'End Date', 'End Time',
        'All Day Event', 'Description', 'Location'
    ])
    writer.writeheader()
    for line in fin:
        parsed = parse_fixture_line(line.strip())
        if parsed:
            writer.writerow(parsed)

print(f"✅ Created: {output_file}")
```

---

## Step 3: Import to Google Calendar..

1. Open [Google Calendar](https://calendar.google.com)
2. Click ⚙️ → **Settings** → **Import & Export**
3. Choose your `giantsfixtures.csv` file
4. Select a calendar to import into (or create one named "Belfast Giants")
5. Click **Import**

Done !!  All fixtures will now appear in your calendar.