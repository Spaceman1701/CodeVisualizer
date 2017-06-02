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
        strcmd = ":T:" + str(self.loc[0]) + "," + str(self.loc[1]) + "," + str(self.size) + \
            "," + str(self.color[0]) + "," + str(self.color[1]) + "," + \
            str(self.color[2]) + "," + str(self.shadow) + ',"' + str(self.text) + '"'
        length = str(len(strcmd))
        return length + strcmd


class Context:
    def __init__(self):
        self.commands = list()
        self.aspectRatio = 1

    def add_command(self, cmd):
        self.commands.append(cmd)

    def set_aspect_ratio(self, ratio):
        if (type(ratio) is str):
            vals = [int(x) for x in ratio.split(':')]
            self.aspectRatio = vals[0] / vals[1]
        else:
            self.aspectRatio = ratio

    def generate_command_string(self):
        output = str(self.aspectRatio) + "@"
        for command in self.commands:
            output += command.generate_command()
        return output

def dothing():
    imp_loc = input()
    text = input()

    ctx = Context()

    exec(open(imp_loc).read(), globals())
    parse("", ctx)

    sys.stdout.write(ctx.generate_command_string())


if __name__ == '__main__':
    if sys.version_info[0] < 3:
        print("requires python 3")
    dothing()



#sys.stdout.write("CMD_LENGTH:L:X,Y,END_X,END_Y,WIDTH,RED,GREEN,BLUE,SHADOW~")
#sys.stdout.write("CMD_LENGTH:T:X,Y,SIZE,'this is text',RED,GREEN,BLUE,SHADOW~")
