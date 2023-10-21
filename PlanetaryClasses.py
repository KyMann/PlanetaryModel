# -*- coding: utf-8 -*-
"""
extends 
    https://gist.github.com/mick001/b329d64b7f8af1d353ab#file-earthmoon-py
with process detailed here
    http://firsttimeprogrammer.blogspot.com/2014/12/earth-moon-system-orbiting-around-sun.html
@author: KyleLaptop

but now implements objects
"""
import math


class Universe(object):
    G=6.67 * math.pow(10,-11)
    def __init__(self):
        self.contents = []
        
    
class Body(Universe):
    def __init__(self, name, mass,  theta0, radius, x,y,z, rotation_distance =0):
        self.name = name
        self.mass = mass
        self.rotation_distance = rotation_distance,
        self.theta0 = theta0
        self.radius = radius
        self.position = [x,y,z]
        
    def gravity_force(self, another_body):
        distance = self.distance(self, another_body)
        g_force = self.G * (self.mass*another_body.mass)/math.pow(distance,2)
        
    def distance(self, another_body):
        return math.sqrt((self.positon[0] - another_body.position[0])**2 + (self.position[1] - another_body.position[1])**2 + (self.position[2] - another_body.position[2])**2)
        
class Star(Body):
    def __inti__(self, name, mass, theta0, radius, x,y,z,rotation_distance=0):
         Body.__init__(self, name, mass, theta0, radius, x,y,z, rotation_distance)
        
        
class Planet(Body):
    def __init__(self,name, mass, theta0, radius,x,y,z, rotation_distance=0):
        Body.__init__(self, name, mass, theta0, radius, x,y,z, rotation_distance)
    def gravitationalForce(self, aUniverse):
        net_x = 0
        net_y = 0
        net_z = 0
        for body in aUniverse.contents:
            gravity_force = self.gravity_force(body)
            
            
            net_x += this_x
            net_y += this_y
            net z += this_z
        return [net_x, net_y, net_z]
        
            