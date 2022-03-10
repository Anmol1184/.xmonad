import os

import openweather
from util import location_info, parser

# Get your API KEY here https://openweathermap.org/api,
# and set an environment variable for OPENWEATHER_API_KEY with your API KEY.
OPENWEATHER_API_KEY = "65c31eadc7c5fb1fd28539dc7e26bebc"


def main() -> None:
    args = parser.args

    city = "Damoh, IN"
    
    api_key = (
        args.api_key[0]
        if args.api_key
        else os.environ.get("OPENWEATHER_API_KEY", OPENWEATHER_API_KEY)
    )
    lang = args.lang[0] if args.lang else "en"
    unit = args.unit[0] if args.unit else "standard"

    weather = openweather.get_weather(city, lang, unit, api_key)
    if weather:
        temp, desc = weather.values()
        if args.verbose:
            print(f"{temp}, {desc}")
        else:
            print(f"{temp}")


if __name__ == "__main__":
    main()
