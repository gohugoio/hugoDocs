---
_comment: Do not remove front matter.
---

Format a `time.Time` value based on [Go's reference time][]:

```text
Mon Jan 2 15:04:05 MST 2006
```

Create a layout string using these components:

Description|Valid components
:--|:--
Year|`"2006" "06"`
Month|`"Jan" "January" "01" "1"`
Day of the week|`"Mon" "Monday"`
Day of the month|`"2" "_2" "02"`
Day of the year|`"__2" "002"`
Hour|`"15" "3" "03"`
Minute|`"4" "04"`
Second|`"5" "05"`
AM/PM mark|`"PM"`
Time zone abbreviation|`"MST"`
Time zone offsets|`"-0700" "-07:00" "-07" "-070000" "-07:00:00"`

Replace the sign in the layout string with a `Z` to print `Z` instead of the offset when the offset is zero.

Description|Valid components
:--|:--
Time zone offsets|`"Z0700" "Z07:00" "Z07" "Z070000" "Z07:00:00"`

```go-html-template
{{ $t := "2023-01-27T23:44:58-08:00" }}
{{ $t = time.AsTime $t }}
{{ $t = $t.Format "Jan 02, 2006 3:04 PM Z07:00" }}

{{ $t }} → Jan 27, 2023 11:44 PM -08:00
```

The `MST` component prints the abbreviation of the date/time's [time zone](g), such as `PST` or `CET`. If the date/time has a [time zone offset](g) but no time zone, the component prints the offset instead, such as `-0800`. Whether a date/time created from a string with an offset has a time zone can depend on the time zone of the system running Hugo.

[Go's reference time]: https://pkg.go.dev/time#pkg-constants
