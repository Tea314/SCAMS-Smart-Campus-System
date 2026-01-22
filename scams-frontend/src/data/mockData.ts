import type { Room, Booking, Notification, User, MaintenanceSchedule, BookingConflict, UtilizationData, DepartmentUsage } from '@/types';

export const mockBookings: Booking[] = [
  {
    id: '1',
    roomId: '1',
    roomName: 'Executive Conference Room',
    userId: 'user-1',
    userName: 'John Doe',
    userDepartment: 'Engineering',
    date: '2025-10-15',
    startTime: '10:00',
    endTime: '11:00',
    purpose: 'Q4 Planning Meeting',
    teamMembers: ['Alice Johnson', 'Bob Smith'],
    status: 'upcoming',
    createdAt: '2025-10-13T08:00:00Z',
  },
  {
    id: '2',
    roomId: '3',
    roomName: 'Innovation Lab',
    userId: 'user-1',
    userName: 'John Doe',
    userDepartment: 'Engineering',
    date: '2025-10-14',
    startTime: '14:00',
    endTime: '15:30',
    purpose: 'Product Brainstorming',
    teamMembers: ['Charlie Davis', 'Diana Wilson'],
    status: 'upcoming',
    createdAt: '2025-10-12T10:30:00Z',
  },
  {
    id: '3',
    roomId: '2',
    roomName: 'Huddle Room A',
    userId: 'user-1',
    userName: 'John Doe',
    userDepartment: 'Engineering',
    date: '2025-10-10',
    startTime: '09:00',
    endTime: '10:00',
    purpose: 'Sprint Planning',
    teamMembers: ['Eve Martinez'],
    status: 'completed',
    createdAt: '2025-10-08T15:00:00Z',
  },
  {
    id: '4',
    roomId: '1',
    roomName: 'Executive Conference Room',
    userId: 'user-2',
    userName: 'Sarah Williams',
    userDepartment: 'Marketing',
    date: '2025-10-14',
    startTime: '09:00',
    endTime: '10:30',
    purpose: 'Marketing Campaign Review',
    teamMembers: ['Tom Harris'],
    status: 'upcoming',
    createdAt: '2025-10-13T11:00:00Z',
  },
  {
    id: '5',
    roomId: '5',
    roomName: 'Training Room',
    userId: 'user-3',
    userName: 'Michael Chen',
    userDepartment: 'HR',
    date: '2025-10-16',
    startTime: '13:00',
    endTime: '17:00',
    purpose: 'New student Orientation',
    teamMembers: [],
    status: 'upcoming',
    createdAt: '2025-10-12T14:00:00Z',
  },
];

export const mockNotifications: Notification[] = [
  {
    id: '1',
    type: 'confirmation',
    title: 'Booking Confirmed',
    message: 'Your booking for Executive Conference Room on Oct 15 at 10:00 AM has been confirmed.',
    timestamp: '2025-10-13T08:01:00Z',
    read: false,
  },
  {
    id: '2',
    type: 'reminder',
    title: 'Meeting Reminder',
    message: 'You have a meeting in Innovation Lab tomorrow at 2:00 PM.',
    timestamp: '2025-10-13T09:00:00Z',
    read: false,
  },
  {
    id: '3',
    type: 'confirmation',
    title: 'Booking Confirmed',
    message: 'Your booking for Innovation Lab on Oct 14 at 2:00 PM has been confirmed.',
    timestamp: '2025-10-12T10:31:00Z',
    read: true,
  },
];

export const mockUsers: User[] = [
  {
    id: 'user-1',
    full_name: 'John Doe',
    email: 'john.doe@company.com',
    department: 'Engineering',
    role: 'student',
    status: 'active',
    createdAt: '2024-01-15T00:00:00Z',
  },
  {
    id: 'user-2',
    full_name: 'Sarah Williams',
    email: 'sarah.williams@company.com',
    department: 'Marketing',
    role: 'student',
    status: 'active',
    createdAt: '2024-02-20T00:00:00Z',
  },
  {
    id: 'user-3',
    full_name: 'Michael Chen',
    email: 'michael.chen@company.com',
    department: 'HR',
    role: 'student',
    status: 'active',
    createdAt: '2024-03-10T00:00:00Z',
  },
  {
    id: 'admin-1',
    full_name: 'Admin User',
    email: 'admin@company.com',
    department: 'student',
    role: 'lecturer',
    status: 'active',
    createdAt: '2023-12-01T00:00:00Z',
  },
  {
    id: 'user-4',
    full_name: 'Emily Rodriguez',
    email: 'emily.rodriguez@company.com',
    department: 'Sales',
    role: 'student',
    status: 'active',
    createdAt: '2024-04-05T00:00:00Z',
  },
  {
    id: 'user-5',
    full_name: 'David Kim',
    email: 'david.kim@company.com',
    department: 'Finance',
    role: 'student',
    status: 'inactive',
    createdAt: '2024-01-20T00:00:00Z',
  },
];

export const mockMaintenance: MaintenanceSchedule[] = [
  {
    id: 'm-1',
    roomId: Number('4'),
    roomName: 'Board Room',
    startDate: '2025-10-13',
    endDate: '2025-10-15',
    reason: 'AV System Upgrade',
    status: 'in-progress',
  },
  {
    id: 'm-2',
    roomId: Number('5'),
    roomName: 'Training Room',
    startDate: '2025-10-20',
    endDate: '2025-10-21',
    reason: 'Carpet Replacement',
    status: 'scheduled',
  },
];

export const mockConflicts: BookingConflict[] = [
  {
    id: 'c-1',
    roomId: '2',
    roomName: 'Huddle Room A',
    date: '2025-10-14',
    timeRange: '10:00 - 11:00',
    bookings: mockBookings.filter(b => b.roomId === '2').slice(0, 2),
  },
];

export const mockUtilization: UtilizationData[] = [
  {
    roomId: '1',
    roomName: 'Executive Conference Room',
    totalHours: 80,
    bookedHours: 62,
    utilizationRate: 77.5,
  },
  {
    roomId: '2',
    roomName: 'Huddle Room A',
    totalHours: 80,
    bookedHours: 45,
    utilizationRate: 56.3,
  },
  {
    roomId: '3',
    roomName: 'Innovation Lab',
    totalHours: 80,
    bookedHours: 38,
    utilizationRate: 47.5,
  },
  {
    roomId: '5',
    roomName: 'Training Room',
    totalHours: 80,
    bookedHours: 52,
    utilizationRate: 65.0,
  },
];

export const mockDepartmentUsage: DepartmentUsage[] = [
  { department: 'Engineering', bookingCount: 45, totalHours: 120 },
  { department: 'Marketing', bookingCount: 32, totalHours: 85 },
  { department: 'HR', bookingCount: 28, totalHours: 95 },
  { department: 'Sales', bookingCount: 35, totalHours: 78 },
  { department: 'Finance', bookingCount: 22, totalHours: 52 },
];

export const generateTimeSlots = (): string[] => {
  const slots: string[] = [];
  for (let hour = 8; hour <= 18; hour++) {
    slots.push(`${hour.toString().padStart(2, '0')}:00`);
    if (hour < 18) {
      slots.push(`${hour.toString().padStart(2, '0')}:30`);
    }
  }
  return slots;
};
