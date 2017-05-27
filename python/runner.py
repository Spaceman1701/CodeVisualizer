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


class Context:
    def __init__(self):
        self.commands = list()

    def addCommand(self, cmd):
        self.commands.append(cmd)


if sys.version_info[0] < 3:
    print("requires python 3")

lc = LineCommand((20, 20), (30, 30), 2, (255, 255, 255), 0)
sys.stdout.write(lc.generate_command())


#sys.stdout.write("CMD_LENGTH:L:X,Y,END_X,END_Y,WIDTH,RED,GREEN,BLUE,SHADOW~")
#sys.stdout.write("CMD_LENGTH:T:X,Y,SIZE,'this is text',RED,GREEN,BLUE,SHADOW~")
