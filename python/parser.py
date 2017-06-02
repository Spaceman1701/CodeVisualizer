import sys
def parse(text, context):
    context.set_aspect_ratio('16:11')
    context.add_command(LineCommand((20, 20), (40, 40), 2, (255, 255, 255), 0))
    context.add_command(TextCommand((50, 50), 10, "Hello World", (255, 255, 255), 0))
