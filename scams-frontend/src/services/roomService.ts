import type { Room, RoomSchedule } from '../types';

// API base URL - can be configured via environment variable or uses default
const API_BASE_URL = (typeof import.meta !== 'undefined' && import.meta.env?.VITE_API_BASE_URL)
  ? import.meta.env.VITE_API_BASE_URL
  : 'http://localhost:8000/api';

/**
 * Room Service - API integration for room endpoints
 */

export const roomService = {
  /**
   * Get all rooms
   * GET /rooms/
   */
  async getAllRooms(): Promise<Room[]> {
    try {
      const response = await fetch(`${API_BASE_URL}/rooms/`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        },
      });

      if (!response.ok) {
        throw new Error(`Failed to fetch rooms: ${response.statusText}`);
      }

      const data = await response.json();
      return data.rooms || [];
    } catch (error) {
      console.error('Error fetching rooms:', error);
      throw error;
    }
  },

  /**
   * Get room details by ID
   * GET /rooms/{room_id}
   */
  async getRoomById(roomId: number): Promise<Room> {
    try {
      const response = await fetch(`${API_BASE_URL}/rooms/${roomId}`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        },
      });

      if (!response.ok) {
        throw new Error(`Failed to fetch room: ${response.statusText}`);
      }

      return await response.json();
    } catch (error) {
      console.error(`Error fetching room ${roomId}:`, error);
      throw error;
    }
  },

  /**
   * Get room schedule
   * GET /rooms/{room_id}/schedule?date=YYYY-MM-DD
   */
  async getRoomSchedule(roomId: number, date: string): Promise<RoomSchedule> {
    try {
      const response = await fetch(
        `${API_BASE_URL}/rooms/${roomId}/schedule?date=${date}`,
        {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          },
        }
      );

      if (!response.ok) {
        throw new Error(`Failed to fetch schedule: ${response.statusText}`);
      }

      return await response.json();
    } catch (error) {
      console.error(`Error fetching schedule for room ${roomId}:`, error);
      throw error;
    }
  },

  /**
   * Check if a room is available at a specific time slot
   */
  isRoomAvailable(schedule: RoomSchedule, timeSlot: string): boolean {
    return !schedule.scheduled_slots.includes(timeSlot);
  },

  /**
   * Get unique device names from a room
   */
  getUniqueDevices(room: Room): string[] {
    const uniqueNames = new Set(room.devices.map(device => device.name));
    return Array.from(uniqueNames);
  },

  /**
   * Format room location string
   */
  formatRoomLocation(room: Room): string {
    return `${room.building_name}, Floor ${room.floor_number}`;
  },

  /**
   * Get default room image (fallback for null image_url)
   */
  getRoomImage(room: Room): string {
    if (room.image_url) {
      return room.image_url;
    }
    // Return a default placeholder image from Unsplash
    return 'https://images.unsplash.com/photo-1497366216548-37526070297c?w=800&h=600&fit=crop';
  },
};
