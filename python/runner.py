import sys


class LineCommand:
    def __init__(self, start, end, width, color, shadow):
        self.start = start
        self.end = end
        self.width = width
        self.color = color
        self.shadow = shadow

    def generate_command(self):
        strCmd = ":L:" + str(self.start[0]) + "," + str(self.start[1]) + "," + str(self.end[0]) + \
            "," + str(self.end[1]) + "," + str(self.width) + "," + str(self.color[0]) + "," + \
            str(self.color[1]) + "," + str(self.color[2]) + "," + str(self.shadow)
        length = str(len(strCmd))
        return length + strCmd

class TextCommand:
    def __init__(self, loc, size, text, color, shadow):
        self.loc = loc
        self.size = size
        self.text = text
        self.color = color
        self.shadow = shadow

    def generate_command(self):
        strcmd = ":T:" + str(self.loc[0]) + "," + str(self.loc[1]) + "," + str(self.size) + ",\"" + \
            str(self.text) + "\"," + str(self.color[0]) + "," + str(self.color[1]) + "," + \
            str(self.color[2]) + "," + str(self.shadow) ",\"" + str(self.text) + "\","
        length = str(len(strcmd))
        return length + strcmd


class Context:
    def __init__(self):
        self.commands = list()

    def addCommand(self, cmd):
        self.commands.append(cmd)


if sys.version_info[0] < 3:
    print("requires python 3")

imp_loc = input()
imp_name = input()
text = input()

ctx = Context()

doimp = False
if doimp:
    sys.path.insert(1, imp_loc)
    from imp_name import parse
    parse(text, ctx)
else:
    from parser import parse
    parse(text, ctx)

for command in ctx.commands:
    sys.stdout.write(command.generate_command())

#sys.stdout.write("CMD_LENGTH:L:X,Y,END_X,END_Y,WIDTH,RED,GREEN,BLUE,SHADOW~")
#sys.stdout.write("CMD_LENGTH:T:X,Y,SIZE,'this is text',RED,GREEN,BLUE,SHADOW~")
