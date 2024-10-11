use std::fmt;

#[derive(PartialEq, PartialOrd, Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let total_minutes = hours * 60 + minutes;
        Clock::from_minutes(total_minutes)
    }

    pub fn to_string(&self) -> String {
        format!("{:02}:{:02}", &self.hours, &self.minutes) // Con el :02, asegura que haya dos digitos.
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let result_minutes = self.hours * 60 + self.minutes + minutes; // Haciendo con nros asi, los transformamos luego, por eso en los tests como parametros pasan 1431 por ejemplo.
        Clock::from_minutes(result_minutes)
    }

    fn from_minutes(total_minutes: i32) -> Self {
        let minutes_day = 24 * 60; // 1440 minutes for day

        // Contempla tambien, nros negativos - Paso clave
        let wrapped_minutes = ((total_minutes % minutes_day) + minutes_day) % minutes_day;

        let hours = wrapped_minutes / 60; // Minutes in hours
        let minutes = wrapped_minutes % 60; // Rest of minutes after hours

        Clock { hours, minutes }
    }

}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result { // Nos ahorramos hacer el to_string. Hace un format! automatico en base a las condiciones que le pasamos.
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}
