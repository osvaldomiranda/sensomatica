import ephem
import sys, getopt

def main(argv):
  object_solarsistem = ''
  datetime = ''
  try:
    opts, args = getopt.getopt(argv,"ho:d:",["object_solarsistem=","datetime="])
  except getopt.GetoptError:
    print 'planeta.py -o <object_solarsistem at format Mars> -d <datetime at 2018/07/05t23:59:59>'
    sys.exit(2)
  for opt, arg in opts:
    if opt == '-h':
      print 'planeta.py -o <object_solarsistem at format Mars> -d <datetime at 2018/07/05t23:59:59>'
      sys.exit()
    elif opt in ("-o", "--object_solarsistem"):
      object_solarsistem = arg
    elif opt in ("-d", "--datetime"):
      datetime = arg

  My_datetime = datetime.replace('t', ' ')
  planet = ephem.Mercury()
  if object_solarsistem == 'Venus':
    planet = ephem.Venus()
  elif object_solarsistem == "Mars":
    planet = ephem.Mars()
  elif object_solarsistem == "Jupiter":
    planet = ephem.Jupiter()
  elif object_solarsistem == "Saturn":
    planet = ephem.Saturn()
  elif object_solarsistem == "Uranus":
    planet = ephem.Uranus()
  elif object_solarsistem == "Neptune":
    planet = ephem.Neptune()
  elif object_solarsistem == "Pluto":
    planet = ephem.Pluto()
  elif object_solarsistem == "Moon":
    planet = ephem.Moon()
  elif object_solarsistem == "Sun":
    planet = ephem.Sun()

  planet.compute(My_datetime)
  print planet.ra, planet.dec

if __name__ == "__main__":
   main(sys.argv[1:])



