package teamcity;

using StringTools;

class ServiceMessage {
    public static function format(messageName:String, properties:haxe.DynamicAccess<String>):String {
        var parts = [messageName];
        for (key in properties.keys()) {
            var value = escape(properties[key]);
            parts.push('$key=\'$value\'');
        }
        return '##teamcity[${parts.join(" ")}]';
    }

    public static function escape(value:String):String {
        return value.replace("|", "||").replace("[", "|[").replace("]", "|]").replace("'", "|'").replace("\n", "|n").replace("\r", "|r");
    }
}
